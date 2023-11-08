import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/data/repositories/products_repository_impl.dart';

class ProductsUsecase {
  late final ProductsRepositoryImpl _productsRepository;

  ProductsUsecase() {
    _productsRepository = ProductsRepositoryImpl();
  }

  Future<List<Product>> getProductsOnOffer() async {
    return await _productsRepository.getProductsOnOffer();
  }

  Future<List<Product>> getProductsKeyboards() async {
    return await _productsRepository.getProductsKeyboards();
  }

  Future<List<Product>> getProductsMouses() async {
    return await _productsRepository.getProductsMouses();
  }

  Future<Product> getProduct(String id) async {
    return await _productsRepository.getProduct(id);
  }

  Future<List<Product>> getRecommendedProducts(String slug, String productId) async {
    return await _productsRepository.getRecommendedProducts(slug, productId);
  }
}
