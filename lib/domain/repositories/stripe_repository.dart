import 'package:fsw_store/domain/repositories/base_repository.dart';

abstract class StripeRepository extends BaseRepository {
  Future<dynamic> createPaymentIntent(int amount);
}
