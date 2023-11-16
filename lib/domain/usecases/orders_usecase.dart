import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/data/repositories/orders_repository_impl.dart';

class OrdersUsecase {
  late final OrdersRepositoryImpl _ordersRepository;

  OrdersUsecase() {
    _ordersRepository = OrdersRepositoryImpl();
  }

  Future<List<Order>> getOrders() async {
    return await _ordersRepository.getOrders();
  }
}
