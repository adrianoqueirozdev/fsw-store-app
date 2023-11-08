import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/domain/usecases/products_usecase.dart';
import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_events.dart';
import 'package:fsw_store/presentation/_blocs/categories/recommended_products/recommended_products_state.dart';

class RecommendedProductsBloc extends Bloc<RecommendedProductsEvents, RecommendedProductsState> {
  final ProductsUsecase _productsUsecase = ProductsUsecase();

  RecommendedProductsBloc() : super(RecommendedProductsInitialState()) {
    on<GetRecommendedProductsEvent>((event, emit) async {
      final products = await _productsUsecase.getRecommendedProducts(event.slug, event.productId);
      emit(RecommendedProductsLoadedState(products: products));
    });
  }
}
