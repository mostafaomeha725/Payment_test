import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymant_app/Core/utilies/ApiServices.dart';
import 'package:paymant_app/Features/Checkout/data/Models/Payment_intent_input_model.dart';
import 'package:paymant_app/Features/Checkout/data/Models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:paymant_app/Features/Checkout/data/Models/payment_intent_model/payment_intent_model.dart';

class StripeServices {
  Apiservices apiservices = Apiservices();
  String secretKey =
      'sk_test_51PqXmHGYO69Mqaz8nisgRXFCKKoEHM6zP4o9mvo64GoFXD0KGY9xySW95FIk1YeByKCn32A5VhOoJq9n9U46uN2p00NFtbbpk5';
  String respnseUrlPaymentIntent = 'https://api.stripe.com/v1/payment_intents';
  String respnseUrlEphemeralKey = 'https://api.stripe.com/v1/ephemeral_keys';
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentitentinputmodel) async {
    var response = await apiservices.post(
      body: paymentitentinputmodel.toJson(),
      url: respnseUrlPaymentIntent,
      token: secretKey,
    );
    var paymentIntentmodel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentmodel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String ephemeralKey}) async {
    var response = await apiservices.post(
        body: {
          'customer': ephemeralKey,
        },
        url: respnseUrlEphemeralKey,
        token: secretKey,
        header: {
          'Authorization': "Bearer $secretKey",
          'Stripe-Version': "2024-06-20",
        });
    var ephemeralKeyatt = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyatt;
  }

  Future initPaymentSheet(
      {required String clientsecret,
      required String ephemeralKey,
      required String id}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Mostafa',
        paymentIntentClientSecret: clientsecret,
        customerEphemeralKeySecret: ephemeralKey,
        customerId: id,
      ),
    );
  }

  Future displaypaymentsheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentitentinputmodel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentitentinputmodel);
    var ephemeralKeymodel = await createEphemeralKey(
        ephemeralKey: paymentitentinputmodel.custometId);

    await initPaymentSheet(
        clientsecret: paymentIntentModel.clientSecret!,
        ephemeralKey: ephemeralKeymodel.secret!,
        id: paymentitentinputmodel.custometId);
    await displaypaymentsheet();
  }
}
