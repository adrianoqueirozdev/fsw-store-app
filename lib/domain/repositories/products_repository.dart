import 'package:fsw_store/data/models/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProductsOnOffer();

  Future<List<Product>> getProductsKeyboards();

  Future<List<Product>> getProductsMouses();
}
