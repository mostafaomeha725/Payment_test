import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/First_Thank_You_Widget.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Second_Thank_You_Widget.dart';
import 'package:paymant_app/Features/Checkout/presentation/Views/Widgets/Third_Thank_You_Widget.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    log(screenHeight.toString());
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.08), // Responsive padding
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05), // Responsive padding
              child: const Column(
                children: [
                  Expanded(flex: 8, child: FirstThankYouWidget()),
                  Expanded(flex: 4, child: SecondThankYouWidget()),
                  Expanded(flex: 6, child: ThirdThankYouWidget()),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.25,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.25,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: -50,
            child: CircleAvatar(
              radius: screenWidth * 0.15, // Responsive radius
              backgroundColor: const Color(0xffEDEDED),
              child: CircleAvatar(
                radius: screenWidth * 0.12, // Responsive radius
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.2 + screenHeight * 0.069,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.1), // Responsive padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the dots
                children: List.generate(
                  screenWidth < 380
                      ? 24
                      : screenWidth > 430
                          ? 32
                          : 27,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Container(
                      color: const Color(0xffB8B8B8),
                      height: 2,
                      width: 5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
