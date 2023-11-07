import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/domain/repositories/products_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<Product>> getProducts() async {
    final data = await supabase.from("Product").select().gt("discountPercentage", 0) as List;

    return data.map((e) => Product.fromJson(e)).toList();
  }
}
