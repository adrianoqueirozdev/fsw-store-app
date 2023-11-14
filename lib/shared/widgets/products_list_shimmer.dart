import 'package:flutter/material.dart';
import 'package:fsw_store/shared/widgets/shimmer_item.dart';
import 'package:shimmer/shimmer.dart';

class ProductsListShimmer extends StatelessWidget {
  const ProductsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 230,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: size.width / 2.8,
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerItem(
                  width: size.width / 2.8,
                  height: 160,
                  borderRadius: 10,
                  direction: ShimmerDirection.ttb,
                ),
                const SizedBox(height: 4),
                ShimmerItem(width: size.width / 2.8),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerItem(
                      width: size.width / 6,
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
