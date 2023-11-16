import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/data/repositories/order_repository_impl.dart';

class OrderUsecase {
  late final OrderRepositoryImpl _orderRepository;

  OrderUsecase() {
    _orderRepository = OrderRepositoryImpl();
  }

  Future<Order> getOrder() async {
    return await _orderRepository.getOrder();
  }
}
