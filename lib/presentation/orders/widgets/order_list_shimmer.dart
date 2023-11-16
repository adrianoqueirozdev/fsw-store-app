import 'package:flutter/material.dart';
import 'package:fsw_store/shared/widgets/shimmer_item.dart';

class OrderListShimmer extends StatelessWidget {
  const OrderListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: ShimmerItem(
            height: 70,
            borderRadius: 10,
          ),
        );
      },
    );
  }
}
