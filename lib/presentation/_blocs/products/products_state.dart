import 'package:fsw_store/data/models/product.dart';

abstract class ProductsState {
  final List<Product> products;

  ProductsState({required this.products});
}

class ProductsInitialState extends ProductsState {
  ProductsInitialState() : super(products: []);
}

class ProductsLoadedState extends ProductsState {
  ProductsLoadedState({required List<Product> products}) : super(products: products);
}

class ProductsErrorState extends ProductsState {
  final String message;

  ProductsErrorState({required this.message}) : super(products: []);
}
