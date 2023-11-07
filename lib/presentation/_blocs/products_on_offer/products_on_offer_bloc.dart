import 'package:bloc/bloc.dart';
import 'package:fsw_store/domain/usecases/products_usecase.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_events.dart';
import 'package:fsw_store/presentation/_blocs/products_on_offer/products_on_offer_state.dart';

class ProductsOnOfferBloc extends Bloc<ProductsOnOfferEvents, ProductsOnOfferState> {
  final ProductsUsecase _productsUsecase = ProductsUsecase();

  ProductsOnOfferBloc() : super(ProductsOnOfferInitialState()) {
    on<GetProductsOnOfferEvent>((event, emit) async {
      final data = await _productsUsecase.getProductsOnOffer();

      emit(ProductsOnOfferLoadedState(products: data));
    });
  }
}
