import 'package:flutter/material.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Check_out_view_body.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/MyCart_Appbar.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const MycartAppbar()),
      body: const CheckOutViewBody(),
    );
  }
}
