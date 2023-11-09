import 'package:fsw_store/data/models/category.dart';

abstract class CategoryProductsState {
  final Category? category;

  CategoryProductsState({this.category});
}

class CategoryProductsInitialState extends CategoryProductsState {
  CategoryProductsInitialState() : super(category: null);
}

class CategoryProductsLoadedState extends CategoryProductsState {
  CategoryProductsLoadedState({required Category category}) : super(category: category);
}

class CategoryProductsErrorState extends CategoryProductsState {
  final String message;

  CategoryProductsErrorState({required this.message}) : super(category: null);
}
