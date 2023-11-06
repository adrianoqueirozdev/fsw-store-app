import 'package:fsw_store/presentation/_blocs/categories/categories_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_events.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final CategoriesBloc categoriesBloc;

  @override
  void onInit() {
    categoriesBloc = CategoriesBloc();

    categoriesBloc.add(GetCategoriesEvent());

    super.onInit();
  }
}
