import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/domain/repositories/base_repository.dart';

abstract class OrderRepository extends BaseRepository {
  Future<Order> getOrder();
}
