import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 4000,
      splash: Column(children: [
        Expanded(
          child: Assets.logo()
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Thrift Shop',
          style: TextStyle(fontSize: 30),
        )
      ]),
      nextScreen: const OnBoarding(),
      splashTransition: SplashTransition.scaleTransition,
      // pageTransitionType: PageTransitionType.size,
      backgroundColor: Colors.white,
    );
  }
}
