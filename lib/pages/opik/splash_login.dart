// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thrilogic_shop/pages/yozi/login_page.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class SplashLogin extends StatelessWidget {
  const SplashLogin({super.key, required this.navigate});

  final bool navigate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            lottieAsset(
              'login',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                navigate == true
                    ? Navigator.pushReplacement(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          child: const LoginScreen(),
                          center: const FractionalOffset(0.5, 0.5),
                        ),
                      )
                    : Navigator.push(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          child: const LoginScreen(),
                          center: const FractionalOffset(0.5, 0.5),
                        ),
                      );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 113, vertical: 15)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Warna().icon),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              child: Text(
                'LOGIN',
                style: Font.style(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
