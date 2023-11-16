import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/order.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/shared/helpers/format_currency_brl.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/cached_network_image_widget.dart';

class OrderProductItem extends StatelessWidget {
  final Product product;
  final OrderProduct orderProduct;

  const OrderProductItem({
    super.key,
    required this.product,
    required this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.onSecondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImageWidget(
              imageUrl: product.imageUrls[0],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width - 138,
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text.rich(
                  TextSpan(
                    text: 'Vendido e entregue por ',
                    style: textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: 'FSW Store',
                        style: textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: size.width - 138,
                child: Text(
                  product.name,
                  style: textTheme.bodySmall?.copyWith(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: size.width - 138,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          text: "${formatCurrencyBrl(product.totalPrice)}  ",
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: formatCurrencyBrl(product.basePrice),
                              style: textTheme.bodySmall?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey.shade600,
                                decorationColor: Colors.grey.shade600,
                              ),
                            )
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "Qtd: ${orderProduct.quantity}",
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
