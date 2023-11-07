import 'package:fsw_store/data/models/product.dart';

abstract class ProductsOnOfferState {
  final List<Product> products;

  ProductsOnOfferState({required this.products});
}

class ProductsOnOfferInitialState extends ProductsOnOfferState {
  ProductsOnOfferInitialState() : super(products: []);
}

class ProductsOnOfferLoadedState extends ProductsOnOfferState {
  ProductsOnOfferLoadedState({required List<Product> products}) : super(products: products);
}

class ProductsOnOfferErrorState extends ProductsOnOfferState {
  final String message;

  ProductsOnOfferErrorState({required this.message}) : super(products: []);
}
