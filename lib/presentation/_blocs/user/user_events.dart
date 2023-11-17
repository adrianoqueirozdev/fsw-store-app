import 'package:fsw_store/data/models/current_user.dart';

abstract class UserEvents {
  final CurrentUser user;

  UserEvents(this.user);
}

class AddUserEvent extends UserEvents {
  AddUserEvent({required CurrentUser user}) : super(user);
}

class GetUserEvent extends UserEvents {
  GetUserEvent({required CurrentUser user}) : super(user);
}
