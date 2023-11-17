import 'package:fsw_store/data/models/current_user.dart';

abstract class UserState {
  final CurrentUser? currentUser;

  UserState({this.currentUser});
}

// add user
class AddUserInitialState extends UserState {}

class AddUserLoadedState extends UserState {}

class AddUserErrorState extends UserState {}

// get user
class GetUserInitialState extends UserState {
  GetUserInitialState() : super(currentUser: null);
}

class GetUserLoadedState extends UserState {
  GetUserLoadedState({required CurrentUser? currentUser}) : super(currentUser: currentUser);
}

class GetUserErrorState extends UserState {}
