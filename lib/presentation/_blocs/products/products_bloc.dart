import 'package:bloc/bloc.dart';
import 'package:fsw_store/domain/usecases/products_usecase.dart';
import 'package:fsw_store/presentation/_blocs/products/products_events.dart';
import 'package:fsw_store/presentation/_blocs/products/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvents, ProductsState> {
  final ProductsUsecase _productsUsecase = ProductsUsecase();

  ProductsBloc() : super(ProductsInitialState()) {
    on<GetProductsEvent>((event, emit) async {
      final data = await _productsUsecase.getProducts();

      emit(ProductsLoadedState(products: data));
    });
  }
}
