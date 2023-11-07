import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products/products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products/products_state.dart';
import 'package:fsw_store/shared/helpers/computed_total_price.dart';
import 'package:fsw_store/shared/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final ProductsBloc productsBloc;

  const ProductList({super.key, required this.productsBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: productsBloc,
      builder: (context, state) {
        if (state is ProductsInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsLoadedState) {
          final products = state.products;

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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
