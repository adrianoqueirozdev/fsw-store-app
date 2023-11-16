import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/domain/repositories/order_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Order> getOrder() async {
    final data = await supabase.from("Order").select('*, OrderProduct!inner(*, Product!inner(*))') as List;

    return Order.fromJson(data.first);
  }
}
