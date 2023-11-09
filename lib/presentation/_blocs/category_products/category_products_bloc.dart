import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/domain/usecases/categories_usecase.dart';
import 'package:fsw_store/presentation/_blocs/category_products/category_products_events.dart';
import 'package:fsw_store/presentation/_blocs/category_products/category_products_state.dart';

class CategoryProductsBloc extends Bloc<CategoryProductsEvents, CategoryProductsState> {
  final CategoriesUsecase _categoriesUsecase = CategoriesUsecase();

  CategoryProductsBloc() : super(CategoryProductsInitialState()) {
    on<GetCategoryProductsEvent>((event, emit) async {
      final data = await _categoriesUsecase.getProductsByCategory(event.slug);
      emit(CategoryProductsLoadedState(category: data));
    });
  }
}
