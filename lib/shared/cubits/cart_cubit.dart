import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/data/models/cart.dart';
import 'package:fsw_store/data/models/product.dart';

class CartCubit extends Cubit<Cart> {
  CartCubit()
      : super(Cart(
            products: [],
            cartTotalPrice: 0,
            cartBasePrice: 0,
            cartTotalDiscount: 0,
            total: 0,
            subtotal: 0,
            totalDiscount: 0));

  void addProductToCart(Product product) {
    final updatedProducts = _updateProductList(product);

    final subtotal = _calculateSubtotal(updatedProducts);
    final total = _calculateTotal(updatedProducts);
    final totalDiscount = subtotal - total;

    emit(state.copyWith(
      products: updatedProducts,
      subtotal: subtotal,
      total: total,
      totalDiscount: totalDiscount,
    ));
  }

  void decreaseProductQuantity(String productId) {
    final currentStateProducts = state.products;

    final index = currentStateProducts.indexWhere((p) => p.id == productId);
    final productTarget = currentStateProducts[index];
    currentStateProducts[index] = productTarget.copyWith(quantity: productTarget.quantity - 1);

    emit(state.copyWith(
      products: currentStateProducts.where((p) => p.quantity > 0).toList(),
      subtotal: _calculateSubtotal(currentStateProducts),
      totalDiscount: _calculateTotalDiscount(currentStateProducts),
      total: _calculateTotal(currentStateProducts),
    ));
  }

  void increaseProductQuantity(String productId) {
    final currentStateProducts = state.products;

    final index = currentStateProducts.indexWhere((p) => p.id == productId);
    final productTarget = currentStateProducts[index];
    currentStateProducts[index] = productTarget.copyWith(quantity: productTarget.quantity + 1);

    emit(state.copyWith(
      products: currentStateProducts,
      subtotal: _calculateSubtotal(currentStateProducts),
      totalDiscount: _calculateTotalDiscount(currentStateProducts),
      total: _calculateTotal(currentStateProducts),
    ));
  }

  void removeProductFromCart(String productId) {
    final newProducts = state.products;
    newProducts.removeWhere((p) => p.id == productId);

    emit(state.copyWith(
      products: newProducts,
      subtotal: _calculateSubtotal(newProducts),
      totalDiscount: _calculateTotalDiscount(newProducts),
      total: _calculateTotal(newProducts),
    ));
  }

  double _calculateTotal(List<Product> products) {
    return products.fold(0, (previousValue, p) => previousValue + p.totalPrice * p.quantity);
  }

  double _calculateSubtotal(List<Product> products) {
    return products.fold(0, (previousValue, p) => previousValue + p.basePrice * p.quantity);
  }

  double _calculateTotalDiscount(List<Product> products) => _calculateSubtotal(products) - _calculateTotal(products);

  List<Product> _updateProductList(Product product) {
    final index = state.products.indexWhere((p) => p.id == product.id);

    if (index != -1) {
      final productTarget = state.products[index];
      state.products[index] = productTarget.copyWith(quantity: productTarget.quantity + product.quantity);
    } else {
      state.products.add(product);
    }

    return state.products;
  }
}
