import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/domain/repositories/base_repository.dart';

abstract class OrdersRepository extends BaseRepository {
  Future<List<Order>> getOrders(String userId);

  Future<String?> createOrder(List<Product> products, String userId);

  Future<void> updateOrder(String orderId);
}
