import 'package:fsw_store/data/models/product.dart';

abstract class ProductsMousesState {
  final List<Product> productsMouses;

  ProductsMousesState({required this.productsMouses});
}

class ProductsMousesInitialState extends ProductsMousesState {
  ProductsMousesInitialState() : super(productsMouses: []);
}

class ProductsMousesLoadedState extends ProductsMousesState {
  ProductsMousesLoadedState({required List<Product> productsMouses}) : super(productsMouses: productsMouses);
}

class ProductsMousesErrorState extends ProductsMousesState {
  final String message;

  ProductsMousesErrorState({required this.message}) : super(productsMouses: []);
}
