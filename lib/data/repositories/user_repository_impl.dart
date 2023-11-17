import 'package:fsw_store/data/models/current_user.dart';
import 'package:fsw_store/domain/repositories/user_repository.dart';
import 'package:fsw_store/shared/configs/configs_supabase.dart';
import 'package:fsw_store/shared/constants/database_tables.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<void> saveUser(CurrentUser user) async {
    return await supabase.from(DatabaseTables.user).insert({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'image': user.image,
    });
  }

  @override
  Future<CurrentUser?> getUser(String userId) async {
    final data = await supabase.from(DatabaseTables.user).select().eq('id', userId) as List;

    if (data.isNotEmpty) {
      return CurrentUser.fromJson(data.first);
    }

    return null;
  }
}
