import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsw_store/domain/usecases/user_usecase.dart';
import 'package:fsw_store/presentation/_blocs/user/user_events.dart';
import 'package:fsw_store/presentation/_blocs/user/user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final UserUsecase _userUsecase = UserUsecase();

  UserBloc() : super(AddUserInitialState()) {
    on(_mapEventToState);
  }

  void _mapEventToState(UserEvents event, Emitter<UserState> emit) async {
    if (event is AddUserEvent) {
      emit(AddUserInitialState());
      await _userUsecase.saveUser(event.user);
      emit(AddUserLoadedState());
    }

    if (event is GetUserEvent) {
      emit(GetUserInitialState());
      final data = await _userUsecase.getUser(event.user.id!);
      emit(GetUserLoadedState(currentUser: data));
    }
  }
}
