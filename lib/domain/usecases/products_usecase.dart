import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/data/repositories/products_repository_impl.dart';

class ProductsUsecase {
  late final ProductsRepositoryImpl _productsRepository;

  ProductsUsecase() {
    _productsRepository = ProductsRepositoryImpl();
  }

  Future<List<Product>> getProducts() async {
    return await _productsRepository.getProducts();
  }
}
