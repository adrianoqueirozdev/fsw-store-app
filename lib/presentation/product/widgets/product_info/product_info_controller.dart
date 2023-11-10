import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/data/models/product.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:get/get.dart';

class ProductInfoController extends GetxController {
  final context = Get.context!;

  final _quantity = 1.obs;

  int get quantity => _quantity.value;

  void handleDecreaseQuantity() {
    _quantity.value = _quantity.value == 1 ? _quantity.value : _quantity.value - 1;
    update();
  }

  void handleIncreaseQuantity() {
    _quantity.value = _quantity.value + 1;
    update();
  }

  void handleAddToCartClick(Product product) {
    context.read<CartCubit>().addProductToCart(product.copyWith(quantity: quantity));
  }
}
