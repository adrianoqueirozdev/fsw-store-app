import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_state.dart';
import 'package:fsw_store/presentation/catalog/controllers/catalog_controller.dart';
import 'package:fsw_store/presentation/catalog/widgets/catalog_list.dart';
import 'package:fsw_store/presentation/catalog/widgets/catalog_list_shimmer.dart';
import 'package:fsw_store/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:fsw_store/shared/widgets/default_app_bar.dart';
import 'package:fsw_store/shared/widgets/preferred_size_app_bar.dart';
import 'package:fsw_store/shared/widgets/title_screen.dart';
import 'package:get/get.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatalogController>(
      init: CatalogController(),
      builder: (controller) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: preferredSizeAppBar(child: const DefaultAppBar()),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleScreen(
                  label: "Catálogo",
                  icon: Icons.category_outlined,
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: BlocBuilder<CategoriesBloc, CategoriesState>(
                    bloc: controller.categoriesBloc,
                    builder: (context, state) {
                      return switch (state.runtimeType) {
                        CategoriesInitialState => const CatalogListShimmer(),
                        CategoriesLoadedState => CatalogList(categories: state.categories ?? []),
                        _ => const Center(child: Text("Erro ao carregar categorias"))
                      };
                    },
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
