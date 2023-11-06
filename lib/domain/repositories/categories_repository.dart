import 'package:fsw_store/data/models/category.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getCategories();
}
