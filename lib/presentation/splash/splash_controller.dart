import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/shared/constants/routes.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:fsw_store/shared/helpers/read_products_on_the_get_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final context = Get.context!;

  @override
  void onInit() {
    context.read<CartCubit>().setInitialState(readProductsOnTheGetStorage());

    Future.delayed(const Duration(seconds: 2), () => Get.offAllNamed(Routes.home));

    super.onInit();
  }
}
