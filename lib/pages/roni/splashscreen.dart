import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/pages/delvy/create_produk_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().first,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.logo(),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Lottie.asset('assets/lottie/loading.json',
                    controller: _controller, onLoaded: (compos) {
                  _controller
                    ..duration = const Duration(seconds: 4)
                    ..forward().then((value) {
                      Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(seconds: 1),
                            center: const FractionalOffset(0.5, 0.5),
                            child: Storages.getIntroSlider() == false
                                ? const OnBoarding()
                                : const IntegrateAPI(),
                          ));
                    });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
