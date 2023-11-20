import 'package:fsw_store/presentation/_blocs/orders/orders_bloc.dart';
import 'package:fsw_store/presentation/_blocs/orders/order_events.dart';
import 'package:fsw_store/shared/services/sign_in_google_service.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  late final OrdersBloc ordersBloc;

  @override
  void onInit() {
    final userId = SignInGoogleService.auth.currentUser?.uid;

    ordersBloc = OrdersBloc();

    if (userId != null) {
      ordersBloc.add(GetOrdersEvent(userId: userId));
    }

    super.onInit();
  }

  @override
  void onClose() {
    ordersBloc.close();
    super.onClose();
  }
}
