import 'package:fsw_store/data/models/product.dart';

abstract class OrdersEvents {
  final String? userId;

  OrdersEvents({this.userId});
}

class GetOrdersEvent extends OrdersEvents {
  GetOrdersEvent({required String userId}) : super(userId: userId);
}

class CreateOrderEvent extends OrdersEvents {
  final List<Product> products;

  CreateOrderEvent({required String userId, required this.products}) : super(userId: userId);
}

class UpdateOrderEvent extends OrdersEvents {
  final String orderId;

  UpdateOrderEvent({required this.orderId});
}
