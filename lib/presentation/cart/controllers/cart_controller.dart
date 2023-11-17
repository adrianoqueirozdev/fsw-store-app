import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fsw_store/domain/usecases/stripe_usecase.dart';
import 'package:fsw_store/main.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:fsw_store/shared/services/stripe_payment_handle_service.dart';
import 'package:fsw_store/shared/helpers/currency_to_cents.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final context = Get.context!;

  late final StripeUsecase _stripeUsecase;

  void handleFinishPurchase() async {
    final total = context.read<CartCubit>().state.total;

    final data = await _stripeUsecase.createPaymentIntent(currencyToCents(total));
    await StripePaymentHandleService.initPaymentSheet(data['client_secret']);

    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      logger.e("[CartController.handleFinishPurchase]: $e");
    }
  }

  @override
  void onInit() {
    _stripeUsecase = StripeUsecase();

    super.onInit();
  }
}
