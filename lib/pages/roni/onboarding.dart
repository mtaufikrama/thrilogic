import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    // final Color kDarkBlueColor = Color(0xFF053149);

    return OnBoardingSlider(
      finishButtonText: 'Daftar',
      finishButtonTextStyle: const TextStyle(
        color: Colors.brown,
        fontSize: 20,
      ),
      indicatorAbove: true,
      onFinish: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const IntegrateAPI(),
          ),
        );
      },
      skipTextButton: const Text(
        'Lewati',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      // trailing: const Text(
      //   'Masuk',
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: Colors.white,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
      // trailingFunction: () {
      //   Navigator.push(
      //     context,
      //     CupertinoPageRoute(
      //       builder: (context) => const IntegrateAPI(),
      //     ),
      //   );
      // },
      controllerColor: Colors.white,
      finishButtonColor: Colors.white54,
      totalPage: 3,
      headerBackgroundColor: const Color.fromARGB(255, 169, 87, 52),
      pageBackgroundColor: const Color.fromARGB(255, 169, 87, 52),
      background: [
        Image.asset(
          'assets/onboarding/gambar1.png',
          height: 550,
          width: MediaQuery.of(context).size.width/2,
        ),
        Image.asset(
          'assets/onboarding/gambar2.png',
          height: 550,
          width: MediaQuery.of(context).size.width/2,
        ),
        Image.asset(
          'assets/onboarding/gambar3.png',
          height: 550,
          width: MediaQuery.of(context).size.width/2,
        ),
      ],
      speed: 3,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const SizedBox(
                height: 440,
              ),
              const Text(
                'Harga Terbaik, Kualitas Terjamin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: Text(
                  'Dapatkan barang kualitas import dengan harga lebih murah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 440,
              ),
              Text(
                'Eco-Friendly',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  'Mengurangi limbah global sehingga lebih ramah lingkungan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 440,
              ),
              Text(
                'Mulai Sekarang!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  'Mencari barang yang di inginkan dengan hanya klik dan tunggu dirumah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
