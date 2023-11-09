import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_bloc.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_events.dart';
import 'package:get/get.dart';

class DealsController extends GetxController {
  late final ProductsOnOfferBloc productsOnOfferBloc;

  @override
  void onInit() {
    productsOnOfferBloc = ProductsOnOfferBloc();

    productsOnOfferBloc.add(GetProductsOnOfferEvent());
    super.onInit();
  }

  @override
  void onClose() {
    productsOnOfferBloc.close();
    super.onClose();
  }
}
