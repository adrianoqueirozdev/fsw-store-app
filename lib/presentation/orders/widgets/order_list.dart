import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/presentation/orders/widgets/order-item/order-item.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;

  const OrderList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderItem(order: orders[index]),
    );
  }
}
