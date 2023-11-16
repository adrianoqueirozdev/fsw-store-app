import 'package:fsw_store/data/models/order.dart';

abstract class OrderState {
  final Order? order;

  OrderState({this.order});
}

class OrderInitialState extends OrderState {
  OrderInitialState() : super(order: null);
}

class OrderLoadedState extends OrderState {
  OrderLoadedState({required Order order}) : super(order: order);
}

class OrderErrorState extends OrderState {
  final String message;

  OrderErrorState({required this.message}) : super(order: null);
}
