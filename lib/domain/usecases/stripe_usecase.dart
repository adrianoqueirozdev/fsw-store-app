import 'package:fsw_store/data/repositories/stripe_repository_impl.dart';

class StripeUsecase {
  late final StripeRepositoryImpl _stripeRepositoryImpl;

  StripeUsecase() {
    _stripeRepositoryImpl = StripeRepositoryImpl();
  }

  Future createPaymentIntent(int amount, String orderId) async {
    return await _stripeRepositoryImpl.createPaymentIntent(amount, orderId);
  }
}
