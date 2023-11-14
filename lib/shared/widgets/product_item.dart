import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/helpers/format_currency_brl.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/cached_network_image_widget.dart';
import 'package:fsw_store/shared/widgets/discount_badge.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final double? width;
  final double height;
  final Product product;

  const ProductItem({super.key, required this.product, this.width, this.height = 160});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Get.toNamed(Routes.product, arguments: product.id, preventDuplicates: false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  width: width ?? size.width / 2.8,
                  height: height,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImageWidget(imageUrl: product.imageUrls[0])),
              if (product.discountPercentage > 0)
                Positioned(
                  top: 8,
                  left: 8,
                  child: DiscountBadge(
                    discountPercentage: product.discountPercentage,
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: width ?? size.width / 2.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        "R\$ ${formatCurrencyBrl(product.totalPrice)}",
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                        child: Text(
                          "R\$ ${formatCurrencyBrl(product.basePrice)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey.shade600,
                            decorationColor: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
