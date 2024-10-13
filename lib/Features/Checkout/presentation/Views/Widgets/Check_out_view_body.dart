import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Total_Price_Text.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: Image(
                image: AssetImage('assets/Images/basket_image.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TotalPriceText()
          ],
        ),
      ),
    );
  }
}
