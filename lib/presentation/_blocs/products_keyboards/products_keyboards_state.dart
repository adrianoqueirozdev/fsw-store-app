import 'package:fsw_store/data/models/product.dart';

abstract class ProductsKeyboardsState {
  final List<Product> productsKeyboards;

  ProductsKeyboardsState({required this.productsKeyboards});
}

class ProductsKeyboardsInitialState extends ProductsKeyboardsState {
  ProductsKeyboardsInitialState() : super(productsKeyboards: []);
}

class ProductsKeyboardsLoadedState extends ProductsKeyboardsState {
  ProductsKeyboardsLoadedState({required List<Product> productsKeyboards})
      : super(productsKeyboards: productsKeyboards);
}

class ProductsKeyboardsErrorState extends ProductsKeyboardsState {
  final String message;

  ProductsKeyboardsErrorState({required this.message}) : super(productsKeyboards: []);
}
