import 'package:fsw_store/data/models/current_user.dart';
import 'package:fsw_store/domain/repositories/base_repository.dart';

abstract class UserRepository extends BaseRepository {
  Future<void> saveUser(CurrentUser user);

  Future<CurrentUser?> getUser(String userId);
}
