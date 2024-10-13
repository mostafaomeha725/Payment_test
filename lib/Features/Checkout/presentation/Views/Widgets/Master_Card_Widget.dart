import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';

class MasterCardWidget extends StatelessWidget {
  const MasterCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          leading: SvgPicture.asset('assets/Images/mastercard.svg'),
          title: Text(
            'Credit Card',
            style: Appstyles.styleRegular16(context),
          ),
          subtitle: Text(
            'Mastercard **78',
            style: Appstyles.styleRegular16(context),
          ),
        ),
      ),
    );
  }
}
