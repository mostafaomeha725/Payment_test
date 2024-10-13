import 'package:flutter/material.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';

class MycartAppbar extends StatelessWidget {
  const MycartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back_sharp,
          size: 30,
        ),
        Text('My Cart', style: Appstyles.styleMedium25(context)),
        const Text(
          ' ',
        ),
      ],
    );
  }
}
