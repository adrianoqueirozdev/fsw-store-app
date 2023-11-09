import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/shared/helpers/computed_total_price.dart';
import 'package:fsw_store/shared/widgets/product_item.dart';

class ProductListGrid extends StatelessWidget {
  final List<Product> products;

  const ProductListGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 220,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            width: size.width / 2,
            product: computeProductTotalPrice(products[index]),
          );
        },
      ),
    );
  }
}
