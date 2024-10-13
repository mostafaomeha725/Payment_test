import 'package:flutter/material.dart';

abstract class Appstyles {
  static TextStyle styleRegular18(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular16(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular25(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 25,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24(context, {Color? color}) {
    return TextStyle(
        fontFamily: 'Inter',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black);
  }

  static TextStyle styleMedium22(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 22,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium25(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 25,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold18(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold12(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular5(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 5,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular20(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium13(context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: 13,
      fontWeight: FontWeight.w500,
    );
  }
}

// double getResponsiveFontSize(context, {required double fontSize}) {
//   double scaleFactor = getScaleFactor(context);
//   double responsiveFontSize = fontSize * scaleFactor;

//   double lowerLimit = fontSize * .8;
//   double upperLimit = fontSize * 1.2;

//   return responsiveFontSize.clamp(lowerLimit, upperLimit);
// }

// double getScaleFactor(context) {
//   // var dispatcher = PlatformDispatcher.instance;
//   // var physicalWidth = dispatcher.views.first.physicalSize.width;
//   // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
//   // double width = physicalWidth / devicePixelRatio;

//   double width = MediaQuery.sizeOf(context).width;
//   if (width < 800) {
//     return width / 550;
//   } else if (width < 1200) {
//     return width / 1000;
//   } else {
//     return width / 1700;
//   }
// }
