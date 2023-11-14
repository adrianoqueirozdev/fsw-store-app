import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  final double? size;
  final double width;
  final double height;
  final double borderRadius;
  final BorderRadiusGeometry? border;

  const ShimmerItem({
    super.key,
    this.size,
    this.width = 32,
    this.height = 16,
    this.borderRadius = 4,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: size ?? width,
      height: size ?? height,
      child: Shimmer.fromColors(
        baseColor: colorScheme.tertiary.withOpacity(.5),
        highlightColor: colorScheme.tertiary.withOpacity(.7),
        child: Container(
          width: size ?? width,
          height: size ?? height,
          decoration: BoxDecoration(
            color: colorScheme.tertiaryContainer,
            borderRadius: border ?? BorderRadius.circular(size != null ? size! / 2 : borderRadius),
          ),
        ),
      ),
    );
  }
}
