import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_state.dart';
import 'package:fsw_store/presentation/home/widgets/category_item.dart';

class Categories extends StatelessWidget {
  final CategoriesBloc categoriesBloc;

  const Categories({super.key, required this.categoriesBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      bloc: categoriesBloc,
      builder: (context, state) {
        if (state is CategoriesInitialState) {
          // TODO: implementar loading skeleton
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesLoadedState) {
          final categories = state.categories ?? [];

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 48,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return CategoryItem(
                category: categories[index],
              );
            },
          );
        } else {
          // TODO: implementar mensagem de erro
          return const Center(
            child: Text('Erro ao carregar categorias'),
          );
        }
      },
    );
  }
}
