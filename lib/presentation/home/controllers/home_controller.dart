import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_events.dart';
import 'package:fsw_store/presentation/_blocs/products/products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products/products_events.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final CategoriesBloc categoriesBloc;
  late final ProductsBloc productsBloc;

  @override
  void onInit() {
    categoriesBloc = CategoriesBloc();
    productsBloc = ProductsBloc();

    categoriesBloc.add(GetCategoriesEvent());
    productsBloc.add(GetProductsEvent());

    super.onInit();
  }
}
