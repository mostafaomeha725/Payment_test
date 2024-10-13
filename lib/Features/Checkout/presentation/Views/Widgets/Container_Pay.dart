import 'package:flutter/material.dart';
import 'package:paymant_app/Core/utilies/app_styles.dart';

class ContainerPay extends StatelessWidget {
  const ContainerPay(
      {super.key, required this.text, this.onTap, this.isLoading = false});
  final String text;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xff34A853),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    style: Appstyles.styleMedium22(context),
                  )),
      ),
    );
  }
}
