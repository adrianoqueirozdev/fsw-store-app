import 'package:fsw_store/presentation/_blocs/category_products/category_products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/category_products/category_products_events.dart';
import 'package:get/get.dart';

class CategoryProductsController extends GetxController {
  late final CategoryProductsBloc categoryProductsBloc;

  @override
  void onInit() {
    final slug = Get.arguments as String;

    categoryProductsBloc = CategoryProductsBloc();

    categoryProductsBloc.add(GetCategoryProductsEvent(slug: slug));
    super.onInit();
  }

  @override
  void onClose() {
    categoryProductsBloc.close();
    super.onClose();
  }
}
