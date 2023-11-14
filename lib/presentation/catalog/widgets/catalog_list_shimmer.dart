import 'package:flutter/material.dart';
import 'package:fsw_store/shared/widgets/shimmer_item.dart';

class CatalogListShimmer extends StatelessWidget {
  const CatalogListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: size.width / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return const ShimmerItem(borderRadius: 10);
      },
    );
  }
}
