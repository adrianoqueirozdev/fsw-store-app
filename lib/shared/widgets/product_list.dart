import 'package:flutter/material.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/shared/helpers/computed_total_price.dart';
import 'package:fsw_store/shared/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 230,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = computeProductTotalPrice(products[index]);

          return ProductItem(product: product);
        },
      ),
    );
  }
}
