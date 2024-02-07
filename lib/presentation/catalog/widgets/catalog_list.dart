import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/category.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/cached_network_image_widget.dart';
import 'package:get/get.dart';

class CatalogList extends StatelessWidget {
  final List<Category> categories;

  const CatalogList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: size.width / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return GestureDetector(
          onTap: () => Get.toNamed(Routes.categoryProducts, arguments: category.slug),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 32, top: 24, right: 32, bottom: 56),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      Color.fromRGBO(80, 51, 195, 0.3),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: CachedNetworkImageWidget(imageUrl: category.imageUrl!),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  width: size.width / 2 - 22,
                  decoration: const BoxDecoration(
                    color: AppColors.onSecondaryContainer,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    category.name!,
                    textAlign: TextAlign.center,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
