import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/domain/repositories/orders_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';
import 'package:fsw_store/shared/constants/database_tables.dart';
import 'package:uuid/uuid.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  @override
  Future<List<Order>> getOrders(String userId) async {
    final data = await supabase
        .from(DatabaseTables.order)
        .select('*, ${DatabaseTables.orderProduct}!inner(*, ${DatabaseTables.product}!inner(*))')
        .eq('userId', userId) as List;

    return data.map((order) => Order.fromJson(order)).toList();
  }

  @override
  Future<String?> createOrder(List<Product> products, String userId) async {
    String? orderId;

    await supabase
        .from('Order')
        .insert({
          'id': const Uuid().v4(),
          'userId': userId,
          'status': 'WAITING_FOR_PAYMENT',
        })
        .select()
        .then((data) async {
          final list = data as List;

          if (list.isNotEmpty) {
            final parsedOrder = Order.fromJson(list.first);
            orderId = parsedOrder.id;

            for (var product in products) {
              await supabase.from('OrderProduct').insert({
                'id': const Uuid().v4(),
                'orderId': parsedOrder.id,
                'basePrice': product.basePrice,
                'discountPercentage': product.discountPercentage,
                'productId': product.id,
                'quantity': product.quantity,
              });
            }
          }
        });

    return orderId;
  }

  @override
  Future<void> updateOrder(String orderId) async {
    await supabase.from('Order').update({'status': 'PAYMENT_CONFIRMED'}).eq('id', orderId);
  }
}
