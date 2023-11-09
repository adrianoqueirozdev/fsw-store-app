import 'package:fsw_store/data/models/category.dart';
import 'package:fsw_store/data/repositories/categories_repository_impl.dart';

class CategoriesUsecase {
  late final CategoriesRepositoryImpl _categoriesRepository;

  CategoriesUsecase() {
    _categoriesRepository = CategoriesRepositoryImpl();
  }

  Future<List<Category>> getCategories() async {
    return await _categoriesRepository.getCategories();
  }

  Future<Category> getProductsByCategory(String slug) async {
    return await _categoriesRepository.getProductsByCategory(slug);
  }
}
