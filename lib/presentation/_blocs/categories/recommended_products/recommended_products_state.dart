import 'package:fsw_store/data/models/product.dart';

abstract class RecommendedProductsState {
  final List<Product> products;

  RecommendedProductsState({required this.products});
}

class RecommendedProductsInitialState extends RecommendedProductsState {
  RecommendedProductsInitialState() : super(products: []);
}

class RecommendedProductsLoadedState extends RecommendedProductsState {
  RecommendedProductsLoadedState({required List<Product> products}) : super(products: products);
}

class RecommendedProductsErrorState extends RecommendedProductsState {
  final String message;

  RecommendedProductsErrorState({required this.message}) : super(products: []);
}
