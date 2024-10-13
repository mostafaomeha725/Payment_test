// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Row_Details_Payment.dart';

class FirstThankYouWidget extends StatelessWidget {
  const FirstThankYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //   log(screenHeight.toString());
    return Column(
      children: [
        SizedBox(
          height: screenHeight > 780
              ? 90
              : screenHeight < 700
                  ? 48
                  : 65,
        ),
        Text(
          "Thank You",
          style: Appstyles.styleMedium25(context),
        ),
        FittedBox(
          child: Text(
            'Your transaction was successful',
            style: Appstyles.styleRegular20(context),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.05,
        ),
        const RowDetailsPayment(text1: 'Date', text2: '01/24/2023'),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const RowDetailsPayment(text1: 'Time', text2: '10:15 AM'),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        const RowDetailsPayment(text1: 'To', text2: 'Sam Louis'),
        SizedBox(
          height: screenHeight * 0.005,
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
