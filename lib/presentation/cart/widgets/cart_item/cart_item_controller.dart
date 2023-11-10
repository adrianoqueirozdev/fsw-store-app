import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  final context = Get.context!;
  late final CartCubit cartCubit;

  void handleDecreaseProductQuantity(String productId) {
    cartCubit.decreaseProductQuantity(productId);
  }

  void handleIncreaseProductQuantity(String productId) {
    cartCubit.increaseProductQuantity(productId);
  }

  void handleRemoveProductFromCart(String productId) {
    cartCubit.removeProductFromCart(productId);
  }

  @override
  void onInit() {
    cartCubit = context.read<CartCubit>();

    super.onInit();
  }
}
