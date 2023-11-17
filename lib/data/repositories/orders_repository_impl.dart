import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/domain/repositories/orders_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';
import 'package:fsw_store/shared/constants/database_tables.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  @override
  Future<List<Order>> getOrders() async {
    final data = await supabase
        .from(DatabaseTables.order)
        .select('*, ${DatabaseTables.orderProduct}!inner(*, ${DatabaseTables.product}!inner(*))') as List;

    return data.map((order) => Order.fromJson(order)).toList();
  }
}
