import 'package:fsw_store/presentation/_blocs/orders/orders_bloc.dart';
import 'package:fsw_store/presentation/_blocs/orders/order_events.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  late final OrdersBloc ordersBloc;

  @override
  void onInit() {
    ordersBloc = OrdersBloc();

    ordersBloc.add(GetOrdersEvent());

    super.onInit();
  }

  @override
  void onClose() {
    ordersBloc.close();
    super.onClose();
  }
}
