import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_events.dart';
import 'package:fsw_store/presentation/_blocs/products_mouses/products_mouses_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_mouses/products_mouses_events.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_events.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_events.dart';
import 'package:fsw_store/shared/cubits/cart_cubit.dart';
import 'package:fsw_store/shared/helpers/read_products_on_the_get_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final context = Get.context!;
  late final CategoriesBloc categoriesBloc;
  late final ProductsOnOfferBloc productsOnOfferBloc;
  late final ProductsKeyboardsBloc productsKeyboardsBloc;
  late final ProductsMousesBloc productsMousesBloc;

  void _readProductsOnTheGetStorage() {
    context.read<CartCubit>().state.products = readProductsOnTheGetStorage();
  }

  @override
  void onInit() {
    categoriesBloc = CategoriesBloc();
    productsOnOfferBloc = ProductsOnOfferBloc();
    productsKeyboardsBloc = ProductsKeyboardsBloc();
    productsMousesBloc = ProductsMousesBloc();

    categoriesBloc.add(GetCategoriesEvent());
    productsOnOfferBloc.add(GetProductsOnOfferEvent());
    productsKeyboardsBloc.add(GetProductsKeyboardsEvent());
    productsMousesBloc.add(GetProductsMousesEvent());

    _readProductsOnTheGetStorage();

    super.onInit();
  }

  @override
  void onClose() {
    categoriesBloc.close();
    productsOnOfferBloc.close();
    productsKeyboardsBloc.close();
    productsMousesBloc.close();
    super.onClose();
  }
}
