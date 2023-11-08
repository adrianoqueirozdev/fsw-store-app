import 'package:fsw_store/data/models/product.dart';

abstract class ProductState {
  final Product? product;

  ProductState({this.product});
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(product: null);
}

class ProductLoadedState extends ProductState {
  ProductLoadedState({required Product product}) : super(product: product);
}

class ProductErrorState extends ProductState {
  ProductErrorState() : super(product: null);
}
