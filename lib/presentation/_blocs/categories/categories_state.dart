import 'package:fsw_store/data/models/category.dart';

abstract class CategoriesState {
  final List<Category>? categories;

  CategoriesState({this.categories});
}

class CategoriesInitialState extends CategoriesState {
  CategoriesInitialState() : super(categories: []);
}

class CategoriesLoadedState extends CategoriesState {
  CategoriesLoadedState({required List<Category> categories}) : super(categories: categories);
}

class CategoriesErrorState extends CategoriesState {
  final String message;

  CategoriesErrorState({required this.message}) : super(categories: []);
}
