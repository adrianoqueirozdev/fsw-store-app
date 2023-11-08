import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/domain/repositories/products_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<List<Product>> getProductsOnOffer() async {
    final data = await supabase.from("Product").select().gt("discountPercentage", 0) as List;

    return data.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<List<Product>> getProductsKeyboards() async {
    final data = await supabase.from('Product').select('*, Category!inner(*)').eq('Category.slug', 'keyboards') as List;

    return data.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<List<Product>> getProductsMouses() async {
    final data = await supabase.from('Product').select('*, Category!inner(*)').eq('Category.slug', 'mouses') as List;

    return data.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<Product> getProduct(String id) async {
    final data = await supabase.from('Product').select('*, Category!inner(*)').eq('id', id) as List;
    return Product.fromJson(data.first);
  }

  @override
  Future<List<Product>> getRecommendedProducts(String slug, String productId) async {
    final data = await supabase.from('Product').select('*, Category!inner(*)').eq('Category.slug', slug) as List;

    // parse json to Product
    final recommendedProductsList = data.map((e) => Product.fromJson(e)).toList();

    // remove current product from list
    recommendedProductsList.removeWhere((element) => element.id == productId);

    return recommendedProductsList;
  }
}
