import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Check_out_view.dart';

void main() {
  Stripe.publishableKey =
      'pk_test_51PqXmHGYO69Mqaz8FwJbsr16npEID4OBVEwABhHilZnBniF5leVag8SOokjVjlkDXXhLuBQkyVPqETs53wiGb7Nq007wDbSbGU';
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return const PaymantApp();
      }));
}

class PaymantApp extends StatelessWidget {
  const PaymantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckOutView(),
    );
  }
}
