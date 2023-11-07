import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_events.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_events.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_events.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final CategoriesBloc categoriesBloc;
  late final ProductsOnOfferBloc productsOnOfferBloc;
  late final ProductsKeyboardsBloc productsKeyboardsBloc;

  @override
  void onInit() {
    categoriesBloc = CategoriesBloc();
    productsOnOfferBloc = ProductsOnOfferBloc();
    productsKeyboardsBloc = ProductsKeyboardsBloc();

    categoriesBloc.add(GetCategoriesEvent());
    productsOnOfferBloc.add(GetProductsOnOfferEvent());
    productsKeyboardsBloc.add(GetProductsKeyboardsEvent());

    super.onInit();
  }
}
