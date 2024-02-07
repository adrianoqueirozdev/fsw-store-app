import 'package:fsw_store/data/models/category.dart';
import 'package:fsw_store/domain/repositories/categories_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';
import 'package:fsw_store/shared/constants/database_tables.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  @override
  Future<List<Category>> getCategories() async {
    final data = await supabase.from(DatabaseTables.category).select();

    final parsed = data;

    return parsed.map((e) => Category.fromJson(e)).toList();
  }

  @override
  Future<Category> getProductsByCategory(String slug) async {
    final data =
        await supabase.from(DatabaseTables.category).select('*, ${DatabaseTables.product}!inner(*)').eq('slug', slug);

    return Category.fromJson(data.first);
  }
}
