import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_events.dart';
import 'package:fsw_store/presentation/_blocs/products/products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products/products_events.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_events.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final CategoriesBloc categoriesBloc;
  late final ProductsBloc productsBloc;
  late final ProductsKeyboardsBloc productsKeyboardsBloc;

  @override
  void onInit() {
    categoriesBloc = CategoriesBloc();
    productsBloc = ProductsBloc();
    productsKeyboardsBloc = ProductsKeyboardsBloc();

    categoriesBloc.add(GetCategoriesEvent());
    productsBloc.add(GetProductsEvent());
    productsKeyboardsBloc.add(GetProductsKeyboardsEvent());

    super.onInit();
  }
}
