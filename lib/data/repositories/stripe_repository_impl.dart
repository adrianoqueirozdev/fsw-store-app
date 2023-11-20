import 'package:fsw_store/domain/repositories/stripe_repository.dart';

class StripeRepositoryImpl extends StripeRepository {
  @override
  Future createPaymentIntent(int amount, String orderId) async {
    final response = await stripeApi.post("payment_intents", {
      "amount": amount.toString(),
      "currency": 'BRL',
      "metadata[order_id]": orderId,
    });

    return response;
  }
}
