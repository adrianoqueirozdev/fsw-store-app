import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/domain/usecases/products_usecase.dart';
import 'package:fsw_store/presentation/_blocs/product/product_events.dart';
import 'package:fsw_store/presentation/_blocs/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvents, ProductState> {
  final ProductsUsecase _productsUsecase = ProductsUsecase();

  ProductBloc() : super(ProductInitialState()) {
    on<GetProductEvent>((event, emit) async {
      final product = await _productsUsecase.getProduct(event.id);
      emit(ProductLoadedState(product: product));
    });
  }
}
