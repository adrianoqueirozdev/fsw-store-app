import 'package:fsw_store/data/models/order.dart';

abstract class OrdersState {
  final List<Order> orders;

  OrdersState({required this.orders});
}

class OrdersInitialState extends OrdersState {
  OrdersInitialState() : super(orders: []);
}

class OrdersLoadedState extends OrdersState {
  OrdersLoadedState({required List<Order> orders}) : super(orders: orders);
}

class OrdersErrorState extends OrdersState {
  final String message;

  OrdersErrorState({required this.message}) : super(orders: []);
}

// Create order
class CreateOrderInitialState extends OrdersState {
  final String? userId;

  CreateOrderInitialState({this.userId}) : super(orders: []);
}

class CreateOrderLoadedState extends OrdersState {
  final String? orderId;

  CreateOrderLoadedState({required this.orderId}) : super(orders: []);
}

class CreateOrderErrorState extends OrdersState {
  final String message;

  CreateOrderErrorState({required this.message}) : super(orders: []);
}
