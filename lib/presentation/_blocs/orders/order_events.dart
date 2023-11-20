import 'package:fsw_store/data/models/product.dart';

abstract class OrdersEvents {}

class GetOrdersEvent extends OrdersEvents {}

class CreateOrderEvent extends OrdersEvents {
  final String userId;
  final List<Product> products;

  CreateOrderEvent({required this.userId, required this.products});
}
