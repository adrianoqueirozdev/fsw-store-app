import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fsw_store/domain/usecases/orders_usecase.dart';
import 'package:fsw_store/domain/usecases/stripe_usecase.dart';
import 'package:fsw_store/main.dart';
import 'package:fsw_store/presentation/_blocs/orders/order_events.dart';
import 'package:fsw_store/presentation/_blocs/orders/orders_bloc.dart';
import 'package:fsw_store/presentation/_blocs/orders/orders_state.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:fsw_store/shared/services/sign_in_google_service.dart';
import 'package:fsw_store/shared/services/stripe_payment_handle_service.dart';
import 'package:fsw_store/shared/helpers/currency_to_cents.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final context = Get.context!;
  final OrdersUsecase ordersUsecase = OrdersUsecase();

  late final StripeUsecase _stripeUsecase;
  late final OrdersBloc _ordersBloc;
  late final CartCubit cartCubit;

  void handleFinishPurchase() async {
    final userId = SignInGoogleService.auth.currentUser!.uid;
    final products = cartCubit.state.products;

    _ordersBloc.add(CreateOrderEvent(userId: userId, products: products));
  }

  @override
  void onInit() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    cartCubit = context.read<CartCubit>();
    _stripeUsecase = StripeUsecase();
    _ordersBloc = OrdersBloc();

    _ordersBloc.stream.listen((state) async {
      if (state is CreateOrderLoadedState) {
        final orderId = state.orderId;
        final total = cartCubit.state.total;

        if (orderId != null) {
          final data = await _stripeUsecase.createPaymentIntent(currencyToCents(total), orderId);
          await StripePaymentHandleService.initPaymentSheet(data['client_secret'], isDarkMode);

          try {
            await Stripe.instance.presentPaymentSheet();
            _ordersBloc.add(UpdateOrderEvent(orderId: orderId));
          } catch (e) {
            logger.e("[CartController.handleFinishPurchase]: $e");
          }
        }
      }

      if (state is UpdateOrderLoadedState) {
        cartCubit.reset();
        Get.back();
        Get.toNamed(Routes.orders);
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    _ordersBloc.close();
    super.onClose();
  }
}
