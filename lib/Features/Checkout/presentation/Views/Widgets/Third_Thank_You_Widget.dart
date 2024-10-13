import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Paid_Container.dart';

class ThirdThankYouWidget extends StatelessWidget {
  const ThirdThankYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: SvgPicture.asset('assets/Images/parcode.svg')),
        const Expanded(flex: 2, child: PaidContainer())
      ],
    );
  }
}
