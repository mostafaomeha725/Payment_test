import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paymant_app/Features/Checkout/data/Models/Payment_intent_input_model.dart';
import 'package:paymant_app/Features/Checkout/data/repos/Checkout_repos.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepos) : super(PaymentInitial());
  final CheckoutRepos checkoutRepos;
  Future makePayment(
      {required PaymentIntentInputModel paymentitentinputmodel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepos.makePayment(
        paymentitentinputmodel: paymentitentinputmodel);
    data.fold(
      (fail) => emit(
        PaymentFailure(errMessage: fail.errMessage),
      ), // Handle the Left case
      (r) => emit(
        PaymentSuccess(),
      ), // Handle the Right case
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    // TODO: implement onChange
    log(change.toString());
    super.onChange(change);
  }
}
