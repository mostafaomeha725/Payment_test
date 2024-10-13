import 'package:dartz/dartz.dart';
import 'package:paymant_app/Errors/Failure.dart';
import 'package:paymant_app/Features/Checkout/data/Models/Payment_intent_input_model.dart';

abstract class CheckoutRepos {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentitentinputmodel});
}
