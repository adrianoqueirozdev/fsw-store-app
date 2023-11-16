import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/presentation/orders/widgets/footer_order_item.dart';
import 'package:fsw_store/presentation/orders/widgets/header_order_item.dart';
import 'package:fsw_store/presentation/orders/widgets/order-item/helpers/get_order_status_label.dart';
import 'package:fsw_store/presentation/orders/widgets/order-item/order_item_controller.dart';
import 'package:fsw_store/presentation/orders/widgets/order_product_item.dart';
import 'package:fsw_store/shared/helpers/computed_total_price.dart';
import 'package:fsw_store/shared/helpers/format_currency_brl.dart';
import 'package:fsw_store/shared/helpers/format_date.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<OrderItemController>(
      global: false,
      init: OrderItemController(order.orderProduct!),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.tertiary),
            ),
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                iconColor: Colors.white,
                iconPadding: EdgeInsets.only(left: 16),
                useInkWell: false,
                tapBodyToExpand: true,
              ),
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pedido com ${order.orderProduct!.length} produto(s)".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Pedido feito em ${FormatDate.ddMMYYYYHm(order.createdAt!)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelSmall?.copyWith(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
              collapsed: const SizedBox.shrink(),
              expanded: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderOrderItem(
                        title: "Status",
                        subtitle: getOrderStatusLabel(order.status!),
                        subtitleColor: AppColors.primary,
                      ),
                      HeaderOrderItem(
                        title: "Data",
                        subtitle: FormatDate.ddMMYYYY(order.createdAt!),
                      ),
                      const HeaderOrderItem(
                        title: "Pagamento",
                        subtitle: "Cartão",
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: order.orderProduct!.length,
                    itemBuilder: (context, index) {
                      final orderProduct = order.orderProduct![index];

                      return OrderProductItem(
                        product: computeProductTotalPrice(orderProduct.product!),
                        orderProduct: order.orderProduct![index],
                      );
                    },
                  ),
                  const Divider(),
                  FooterOrderItem(
                    text: "Subtotal",
                    value: formatCurrencyBrl(controller.subtotal),
                  ),
                  const Divider(),
                  const FooterOrderItem(
                    text: "Entrega",
                    value: 'GRÁTIS',
                  ),
                  const Divider(),
                  FooterOrderItem(
                    text: "Descontos",
                    value: "- ${formatCurrencyBrl(controller.totalsDiscounts)}",
                  ),
                  const Divider(),
                  FooterOrderItem(
                    text: "Total",
                    value: formatCurrencyBrl(controller.total),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
