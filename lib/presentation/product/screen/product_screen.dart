import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_state.dart';
import 'package:fsw_store/presentation/_blocs/product/product_bloc.dart';
import 'package:fsw_store/presentation/_blocs/product/product_state.dart';
import 'package:fsw_store/presentation/product/controllers/product_controller.dart';
import 'package:fsw_store/presentation/product/widgets/product_info/product_info.dart';
import 'package:fsw_store/presentation/product/widgets/product_info_shimmer.dart';
import 'package:fsw_store/shared/helpers/computed_total_price.dart';
import 'package:fsw_store/shared/widgets/default_app_bar.dart';
import 'package:fsw_store/shared/widgets/preferred_size_app_bar.dart';
import 'package:fsw_store/shared/widgets/product_list.dart';
import 'package:fsw_store/shared/widgets/products_list_shimmer.dart';
import 'package:fsw_store/shared/widgets/section_title.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      global: false,
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          appBar: preferredSizeAppBar(child: const DefaultAppBar(showDivider: false)),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ProductBloc, ProductState>(
                  bloc: controller.productBloc,
                  builder: (context, state) {
                    return switch (state.runtimeType) {
                      ProductInitialState => const ProductInfoShimmer(),
                      ProductLoadedState => ProductInfo(product: computeProductTotalPrice(state.product!)),
                      _ => const SizedBox.shrink()
                    };
                  },
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle(text: "Produtos recomendados"),
                      BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
                        bloc: controller.recommendedProductsBloc,
                        builder: (context, state) {
                          return switch (state.runtimeType) {
                            RecommendedProductsInitialState => const ProductsListShimmer(),
                            RecommendedProductsLoadedState => ProductList(products: state.products),
                            _ => const SizedBox.shrink()
                          };
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
