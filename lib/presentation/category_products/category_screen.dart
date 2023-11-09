import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/category_products/category_products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/category_products/category_products_state.dart';
import 'package:fsw_store/presentation/category_products/category_products_controller.dart';
import 'package:fsw_store/shared/constants/category_icon.dart';
import 'package:fsw_store/shared/widgets/default_app_bar.dart';
import 'package:fsw_store/shared/widgets/preferred_size_app_bar.dart';
import 'package:fsw_store/shared/widgets/product_list_grid.dart';
import 'package:fsw_store/shared/widgets/title_screen.dart';
import 'package:get/get.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryProductsController>(
      init: CategoryProductsController(),
      builder: (controller) {
        return Scaffold(
          appBar: preferredSizeAppBar(
            child: const DefaultAppBar(),
          ),
          body: BlocBuilder<CategoryProductsBloc, CategoryProductsState>(
            bloc: controller.categoryProductsBloc,
            builder: (context, state) {
              final isLoading = state is CategoryProductsInitialState;
              final category = state.category;

              return Padding(
                padding: const EdgeInsets.only(left: 16, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleScreen(
                      label: isLoading ? 'Carregando...' : category!.name!,
                      icon: isLoading ? Icons.pending : CategoryIcon.categoryIcon[category!.slug!]!,
                    ),
                    const SizedBox(height: 16),
                    Builder(
                      builder: (context) {
                        return switch (state.runtimeType) {
                          CategoryProductsInitialState => const SizedBox.shrink(),
                          CategoryProductsLoadedState => ProductListGrid(products: category!.products!),
                          _ => const SizedBox.shrink()
                        };
                      },
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
