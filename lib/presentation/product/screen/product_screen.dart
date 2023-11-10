import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_state.dart';
import 'package:fsw_store/presentation/_blocs/product/product_bloc.dart';
import 'package:fsw_store/presentation/_blocs/product/product_state.dart';
import 'package:fsw_store/presentation/product/controllers/product_controller.dart';
import 'package:fsw_store/presentation/product/widgets/product_images/product_images.dart';
import 'package:fsw_store/presentation/product/widgets/product_info/product_info.dart';
import 'package:fsw_store/shared/helpers/computed_total_price.dart';
import 'package:fsw_store/shared/widgets/default_app_bar.dart';
import 'package:fsw_store/shared/widgets/preferred_size_app_bar.dart';
import 'package:fsw_store/shared/widgets/product_list.dart';
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
            child: BlocBuilder<ProductBloc, ProductState>(
              bloc: controller.productBloc,
              builder: (context, state) {
                if (state is ProductInitialState) {
                  return const SizedBox.shrink();
                } else if (state is ProductLoadedState) {
                  final product = computeProductTotalPrice(state.product!);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImages(imageUrls: product.imageUrls),
                      ProductInfo(product: product),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: SectionTitle(text: "Produtos recomendados"),
                      ),
                      BlocBuilder<RecommendedProductsBloc, RecommendedProductsState>(
                        bloc: controller.recommendedProductsBloc,
                        builder: (context, state) {
                          if (state is RecommendedProductsInitialState) {
                            return const SizedBox.shrink();
                          } else if (state is RecommendedProductsLoadedState) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: ProductList(products: state.products),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      )
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
