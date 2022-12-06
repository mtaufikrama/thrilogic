// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    // final Color kDarkBlueColor = Color(0xFF053149);

    return OnBoardingSlider(
      finishButtonText: 'GET STARTED',
      finishButtonTextStyle: Font.style(
        color: Colors.black,
        fontSize: 20,
      ),
      indicatorAbove: true,
      onFinish: () async {
        await Storages().setIntroSlider();
        Navigator.pushReplacement(
          context,
          WaveTransition(
            duration: const Duration(milliseconds: 700),
            child: const IntegrateAPI(),
            center: const FractionalOffset(0.5, 0),
          ),
        );
      },
      skipTextButton: Text(
        'Lewati',
        style: Font.style(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      controllerColor: Colors.white,
      finishButtonColor: Colors.white54,
      totalPage: 3,
      headerBackgroundColor: Warna().terang,
      pageBackgroundColor: Warna().terang,
      background: [
        Container(
          margin: const EdgeInsets.only(top: 130),
          child: Lottie.asset('assets/lottie/onboard1.json',
              width: MediaQuery.of(context).size.width),
        ),
        Container(
          margin: const EdgeInsets.only(top: 60),
          child: Lottie.asset('assets/lottie/onboard2.json',
              width: MediaQuery.of(context).size.width * 0.9),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Lottie.asset('assets/lottie/onboard3.json',
              width: MediaQuery.of(context).size.width),
        ),
      ],
      speed: 3,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(child: Container()),
              Text('Hi, Selamat Datang !',
                  textAlign: TextAlign.center,
                  style: Font.style(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Dapatkan kemudahan mencari barang kualitas import dengan harga lebih murah hanya di ThriLogic',
                  textAlign: TextAlign.center,
                  style: Font.style(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white)),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Text('Kapan dan Dimana Saja',
                  textAlign: TextAlign.center,
                  style: Font.style(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Tambahkan barang yang di inginkan ke keranjang dan checkout kapanpun kemudian tunggu dirumah ',
                  textAlign: TextAlign.center,
                  style: Font.style(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white)),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Text('Pengiriman Aman sampai Tujuan',
                  textAlign: TextAlign.center,
                  style: Font.style(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Selalu siap mengantarkan barang yang kamu pesan dengan aman dan sampai tujuan tepat waktu ',
                  textAlign: TextAlign.center,
                  style: Font.style(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white)),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
