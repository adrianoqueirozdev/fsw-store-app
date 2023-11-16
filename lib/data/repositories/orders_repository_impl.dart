import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/domain/repositories/orders_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  @override
  Future<List<Order>> getOrders() async {
    final data = await supabase.from("Order").select('*, OrderProduct!inner(*, Product!inner(*))') as List;

    return data.map((order) => Order.fromJson(order)).toList();
  }
}
