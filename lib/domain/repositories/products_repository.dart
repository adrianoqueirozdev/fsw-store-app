import 'package:fsw_store/data/models/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
}
