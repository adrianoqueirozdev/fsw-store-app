import 'package:bloc/bloc.dart';
import 'package:fsw_store/domain/usecases/products_usecase.dart';
import 'package:fsw_store/presentation/_blocs/products_mouses/products_mouses_events.dart';
import 'package:fsw_store/presentation/_blocs/products_mouses/products_mouses_state.dart';

class ProductsMousesBloc extends Bloc<ProductsMousesEvents, ProductsMousesState> {
  final ProductsUsecase _productsUsecase = ProductsUsecase();

  ProductsMousesBloc() : super(ProductsMousesInitialState()) {
    on<GetProductsMousesEvent>((event, emit) async {
      final productsMouses = await _productsUsecase.getProductsMouses();
      emit(ProductsMousesLoadedState(productsMouses: productsMouses));
    });
  }
}
