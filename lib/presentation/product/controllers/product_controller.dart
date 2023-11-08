import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_bloc.dart';
import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_events.dart';
import 'package:fsw_store/presentation/_blocs/product/product_bloc.dart';
import 'package:fsw_store/presentation/_blocs/product/product_events.dart';
import 'package:fsw_store/presentation/_blocs/product/product_state.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  late final ProductBloc productBloc;
  late final RecommendedProductsBloc recommendedProductsBloc;

  @override
  void onInit() {
    productBloc = ProductBloc();
    recommendedProductsBloc = RecommendedProductsBloc();

    final productId = Get.arguments as String?;

    productBloc.add(GetProductEvent(id: productId!));

    productBloc.stream.listen((state) {
      if (state is ProductLoadedState) {
        recommendedProductsBloc.add(GetRecommendedProductsEvent(
          slug: state.product!.category!.slug!,
          productId: productId,
        ));
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    productBloc.close();
    recommendedProductsBloc.close();
    super.onClose();
  }
}
