import 'package:flutter/material.dart';
import 'package:fsw_store/presentation/product/widgets/product_images/product_images_controller.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/cached_network_image_widget.dart';
import 'package:get/get.dart';

class ProductImages extends StatelessWidget {
  final List<String> imageUrls;

  const ProductImages({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<ProductImagesController>(
      global: false,
      init: ProductImagesController(imageUrls: imageUrls),
      builder: (controller) {
        return Column(
          children: [
            Container(
              color: AppColors.onSecondaryContainer,
              padding: const EdgeInsets.all(24),
              child: CachedNetworkImageWidget(
                imageUrl: controller.currentImage,
                height: size.height / 4,
                width: double.infinity,
                // fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 90,
              width: double.infinity,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: imageUrls.length,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ...imageUrls.map((imageUrl) {
                    return GestureDetector(
                      onTap: () => controller.changeCurrentImage(imageUrl),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.onSecondaryContainer,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: controller.currentImage == imageUrl ? AppColors.primary : Colors.transparent,
                          ),
                        ),
                        child: CachedNetworkImageWidget(imageUrl: imageUrl),
                      ),
                    );
                  }).toList(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
