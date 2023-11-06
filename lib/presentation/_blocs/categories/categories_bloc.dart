import 'package:bloc/bloc.dart';
import 'package:fsw_store/domain/usecases/categories_usecase.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_events.dart';
import 'package:fsw_store/presentation/_blocs/categories/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesState> {
  final CategoriesUsecase _categoriesUsecase = CategoriesUsecase();

  CategoriesBloc() : super(CategoriesInitialState()) {
    on<GetCategoriesEvent>((event, emit) async {
      final data = await _categoriesUsecase.getCategories();

      emit(CategoriesLoadedState(categories: data));
    });
  }
}
