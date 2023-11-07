import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_state.dart';
import 'package:fsw_store/presentation/catalog/catalog_controller.dart';
import 'package:fsw_store/shared/theme/app_colors.dart';
import 'package:fsw_store/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:fsw_store/shared/widgets/default_app_bar.dart';
import 'package:fsw_store/shared/widgets/preferred_size_app_bar.dart';
import 'package:fsw_store/shared/widgets/title_screen.dart';
import 'package:get/get.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

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
                      if (state is CategoriesInitialState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CategoriesLoadedState) {
                        final categories = state.categories ?? [];

                        return GridView.builder(
                          itemCount: categories.length,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: size.width / 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            final category = categories[index];

                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 32, top: 24, right: 32, bottom: 56),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primary,
                                        const Color.fromRGBO(80, 51, 195, 0.3),
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                    ),
                                  ),
                                  child: Image.network(
                                    category.imageUrl!,
                                    fit: BoxFit.contain,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }

                                      final progress = loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                          : null;

                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: progress,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error_outline);
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    width: size.width / 2 - 22,
                                    decoration: const BoxDecoration(
                                      color: AppColors.onSecondaryContainer,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      category.name!,
                                      textAlign: TextAlign.center,
                                      style: textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("Erro ao carregar categorias"),
                        );
                      }
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
