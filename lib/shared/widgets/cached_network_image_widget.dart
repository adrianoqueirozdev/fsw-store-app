import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const CachedNetworkImageWidget({super.key, required this.imageUrl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.contain,
      errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 32),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
    );
  }
}
