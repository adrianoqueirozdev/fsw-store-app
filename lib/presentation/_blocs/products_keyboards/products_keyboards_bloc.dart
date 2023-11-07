import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/domain/usecases/products_usecase.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_events.dart';
import 'package:fsw_store/presentation/_blocs/products_keyboards/products_keyboards_state.dart';

class ProductsKeyboardsBloc extends Bloc<ProductsKeyboardsEvents, ProductsKeyboardsState> {
  final ProductsUsecase _productsUsecase = ProductsUsecase();

  ProductsKeyboardsBloc() : super(ProductsKeyboardsInitialState()) {
    on<GetProductsKeyboardsEvent>((event, emit) async {
      final products = await _productsUsecase.getProductsKeyboards();
      emit(ProductsKeyboardsLoadedState(productsKeyboards: products));
    });
  }
}
