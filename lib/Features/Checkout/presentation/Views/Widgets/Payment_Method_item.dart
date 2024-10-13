import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, required this.image, this.isactive = false});
  final String image;
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        foregroundDecoration: const BoxDecoration(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isactive ? Colors.green : const Color(0xff808080),
            width: 1.5,
          ), // Increase border width
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.green,
          //     spreadRadius: 0,
          //     blurRadius: 4,
          //     offset: Offset(0, 0), // changes position of shadow
          //   ),
          // ],
        ),
        width: 110,
        child: Center(
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
