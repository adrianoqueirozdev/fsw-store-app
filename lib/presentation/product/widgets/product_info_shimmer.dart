import 'package:flutter/material.dart';
import 'package:fsw_store/shared/widgets/shimmer_item.dart';

class ProductInfoShimmer extends StatelessWidget {
  const ProductInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerItem(
          borderRadius: 0,
          height: size.height / 4,
          width: double.infinity,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          width: double.infinity,
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 12,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: List.generate(
              4,
              (index) => const ShimmerItem(borderRadius: 10),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerItem(
                width: size.width * 0.5,
                borderRadius: 0,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  ShimmerItem(
                    width: size.width * 0.3,
                    height: 24,
                    borderRadius: 0,
                  ),
                  const SizedBox(width: 8),
                  const ShimmerItem(
                    width: 32,
                    height: 18,
                    borderRadius: 100,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ShimmerItem(
                width: size.width * 0.2,
                height: 12,
                borderRadius: 0,
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  ShimmerItem(
                    width: 32,
                    height: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ShimmerItem(
                      width: 18,
                    ),
                  ),
                  ShimmerItem(
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ShimmerItem(
                width: size.width * 0.3,
                height: 18,
                borderRadius: 0,
              ),
              const SizedBox(height: 6),
              ShimmerItem(
                width: size.width,
                borderRadius: 0,
              ),
              const SizedBox(height: 4),
              ShimmerItem(
                width: size.width * 0.9,
                borderRadius: 0,
              ),
              const SizedBox(height: 4),
              ShimmerItem(
                width: size.width * 0.8,
                borderRadius: 0,
              ),
              const SizedBox(height: 16),
              ShimmerItem(
                height: 48,
                width: size.width,
                borderRadius: 10,
              ),
              const SizedBox(height: 16),
              ShimmerItem(
                height: 60,
                width: size.width,
                borderRadius: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
