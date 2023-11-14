import 'package:flutter/material.dart';
import 'package:fsw_store/shared/widgets/shimmer_item.dart';
import 'package:shimmer/shimmer.dart';

class ProductsListGridShimmer extends StatelessWidget {
  const ProductsListGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 220,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 16, bottom: 16),
            child: Column(
              children: [
                ShimmerItem(
                  width: size.width / 2,
                  height: 160,
                  borderRadius: 10,
                  direction: ShimmerDirection.ttb,
                ),
                const SizedBox(height: 4),
                ShimmerItem(width: size.width / 2),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerItem(
                      width: size.width / 4,
                      height: 20,
                    ),
                    ShimmerItem(width: size.width / 6),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
