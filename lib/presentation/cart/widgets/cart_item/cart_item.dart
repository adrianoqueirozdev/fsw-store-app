import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/presentation/cart/widgets/cart_item/cart_item_controller.dart';
import 'package:fsw_store/shared/helpers/format_currency_brl.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/cached_network_image_widget.dart';
import 'package:fsw_store/shared/widgets/cart_group_buttons.dart';
import 'package:fsw_store/shared/widgets/custom_icon_button.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<CartItemController>(
      init: CartItemController(),
      global: false,
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 74,
                    padding: const EdgeInsets.all(12),
                    height: 74,
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
                      SizedBox(
                        width: size.width * 0.55,
                        child: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.55,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                "R\$ ${formatCurrencyBrl(product.totalPrice)}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                "R\$ ${formatCurrencyBrl(product.basePrice)}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: textTheme.bodyMedium?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey.shade600,
                                  decorationColor: Colors.grey.shade600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      CartGroupButtons(
                        value: "${product.quantity}",
                        increase: () => controller.handleIncreaseProductQuantity(product.id),
                        decrease: () => controller.handleDecreaseProductQuantity(product.id),
                      ),
                    ],
                  ),
                ],
              ),
              CustomIconButton(
                icon: Icons.delete_outline,
                onPressed: () => controller.handleRemoveProductFromCart(product.id),
              )
            ],
          ),
        );
      },
    );
  }
}
