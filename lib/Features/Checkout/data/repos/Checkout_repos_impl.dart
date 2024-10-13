import 'package:dartz/dartz.dart';
import 'package:paymant_app/Core/utilies/Stripe_Services.dart';
import 'package:paymant_app/Errors/Failure.dart';
import 'package:paymant_app/Features/Checkout/data/Models/Payment_intent_input_model.dart';
import 'package:paymant_app/Features/Checkout/data/repos/Checkout_repos.dart';

class CheckoutReposImpl extends CheckoutRepos {
  @override
  final StripeServices stripeServices = StripeServices();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentitentinputmodel}) async {
    try {
      await stripeServices.makePayment(
          paymentitentinputmodel: paymentitentinputmodel);
      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
