import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/presentation/product/widgets/product_images/product_images.dart';
import 'package:fsw_store/presentation/product/widgets/product_info/product_info_controller.dart';
import 'package:fsw_store/shared/helpers/format_currency_brl.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/cart_group_buttons.dart';
import 'package:fsw_store/shared/widgets/discount_badge.dart';
import 'package:get/get.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<ProductInfoController>(
      init: ProductInfoController(),
      global: false,
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(imageUrls: product.imageUrls),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          "R\$ ${formatCurrencyBrl(product.totalPrice)}",
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        DiscountBadge(discountPercentage: product.discountPercentage),
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        text: "De: ",
                        children: [
                          TextSpan(
                            text: "R\$ ${formatCurrencyBrl(product.basePrice)}",
                            style: textTheme.bodySmall?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey.shade600,
                              color: Colors.grey.shade600,
                            ),
                          )
                        ],
                      ),
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CartGroupButtons(
                      value: controller.quantity.toString(),
                      increase: controller.handleIncreaseQuantity,
                      decrease: controller.handleDecreaseQuantity,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Descrição",
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: size.width,
                      child: Text(
                        product.description,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => controller.handleAddToCartClick(product),
                        child: const Text("ADICIONAR AO CARRINHO"),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.tertiary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.local_shipping_outlined,
                                size: 32,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "Entrega via ",
                                      children: [
                                        TextSpan(
                                          text: "FSPacket®",
                                          style: textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: textTheme.bodySmall,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: "Envio para ",
                                      children: [
                                        TextSpan(
                                          text: "todo Brasil",
                                          style: textTheme.labelSmall?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.onPrimaryContainer,
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: textTheme.labelSmall?.copyWith(
                                      color: AppColors.onPrimaryContainer,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(
                            "Frete Grátis",
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
        );
      },
    );
  }
}
