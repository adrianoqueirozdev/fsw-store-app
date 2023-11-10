import 'package:fsw_store/shared/configs/http_config.dart';
import 'package:fsw_store/shared/constants/environment.dart';

abstract class BaseRepository {
  late final HttpConfig _stripeApi;

  HttpConfig get stripeApi => _stripeApi;

  BaseRepository() {
    _stripeApi = HttpConfig(Environment.stripeApiBaseUrl);
  }
}
