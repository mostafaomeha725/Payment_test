import 'package:flutter/material.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';

class TextDetailesOrder extends StatelessWidget {
  const TextDetailesOrder(
      {super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Appstyles.styleRegular18(context),
        ),
        Text(
          text2,
          style: Appstyles.styleRegular18(context),
        ),
      ],
    );
  }
}
