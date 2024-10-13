class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String custometId;

  PaymentIntentInputModel(
      {required this.custometId, required this.amount, required this.currency});
  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': custometId,
    };
  }
}
