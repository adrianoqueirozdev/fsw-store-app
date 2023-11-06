import 'package:fsw_store/data/models/category.dart';
import 'package:fsw_store/domain/repositories/categories_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  @override
  Future<List<Category>> getCategories() async {
    final data = await supabase.from("Category").select();

    final parsed = data as List;

    return parsed.map((e) => Category.fromJson(e)).toList();
  }
}
