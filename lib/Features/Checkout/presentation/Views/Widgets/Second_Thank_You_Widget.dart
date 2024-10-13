// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Master_Card_Widget.dart';

class SecondThankYouWidget extends StatelessWidget {
  const SecondThankYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //  log(MediaQuery.of(context).size.height.toString());
    return Column(
      children: [
        // const SizedBox(
        //   height: 16,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: Appstyles.styleSemiBold24(context),
            ),
            Text(
              '\$50.97',
              style: Appstyles.styleSemiBold24(context),
            ),
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        const MasterCardWidget(),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.15,
        // ),
      ],
    );
  }
}
