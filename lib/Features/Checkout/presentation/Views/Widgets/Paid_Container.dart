import 'package:flutter/material.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';

class PaidContainer extends StatelessWidget {
  const PaidContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            'Paid',
            style: Appstyles.styleSemiBold24(context, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
