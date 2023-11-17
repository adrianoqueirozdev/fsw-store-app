import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_events.dart';
import 'package:fsw_store/presentation/_blocs/products_mouses/products_mouses_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_mouses/products_mouses_events.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_events.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_events.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final CategoriesBloc categoriesBloc;
  late final ProductsOnOfferBloc productsOnOfferBloc;
  late final ProductsKeyboardsBloc productsKeyboardsBloc;
  late final ProductsMousesBloc productsMousesBloc;

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
