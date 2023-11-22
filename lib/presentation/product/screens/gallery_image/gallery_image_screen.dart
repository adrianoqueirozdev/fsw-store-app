import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fsw_store/presentation/product/screens/gallery_image/gallery_image_controller.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryImageScreen extends StatelessWidget {
  final int initialPage;
  final List<String> imageUrls;

  const GalleryImageScreen({super.key, required this.imageUrls, required this.initialPage});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<GalleryImageController>(
      init: GalleryImageController(initialPage),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.onSecondaryContainer,
          appBar: AppBar(),
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(24),
                child: PhotoViewGallery.builder(
                  backgroundDecoration: const BoxDecoration(
                    color: AppColors.onSecondaryContainer,
                  ),
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      filterQuality: FilterQuality.high,
                      imageProvider: CachedNetworkImageProvider(imageUrls[index]),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
                    );
                  },
                  itemCount: imageUrls.length,
                  pageController: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Text(
                  "${controller.currentPage + 1}/${imageUrls.length}",
                  style: textTheme.labelMedium,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
