import 'package:fsw_store/data/models/current_user.dart';
import 'package:fsw_store/data/repositories/user_repository_impl.dart';

class UserUsecase {
  late final UserRepositoryImpl _userRepository;

  UserUsecase() {
    _userRepository = UserRepositoryImpl();
  }

  Future<void> saveUser(CurrentUser user) async {
    return await _userRepository.saveUser(user);
  }

  Future<CurrentUser?> getUser(String userId) async {
    return await _userRepository.getUser(userId);
  }
}
