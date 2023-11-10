import 'package:fsw_store/domain/repositories/stripe_repository.dart';

class StripeRepositoryImpl extends StripeRepository {
  @override
  Future createPaymentIntent(int amount) async {
    Map<String, dynamic> body = {
      'amount': amount.toString(),
      'currency': 'BRL',
    };

    final response = await stripeApi.post("payment_intents", body);

    return response;
  }
}
