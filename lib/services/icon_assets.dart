import 'package:flutter/material.dart';
import 'package:thrilogic_shop/services/styles.dart';

class Assets {
  static Image navbarIcon(String namaicon) {
    return Image.asset(
      'assets/icon_navbar/$namaicon.png',
      color: Warna().icon,
      height: 25,
    );
  }

  static Image lainnyaIcon(String namaicon, {Color? color, double? height}) {
    return Image.asset(
      'assets/icon_lainnya/$namaicon.png',
      color: color,
      height: height ?? 20,
    );
  }

  static Image logo({double? width}) {
    return Image.asset(
      'assets/logo/logo_thrilogic.png',
      width: width,
    );
  }

  static Image appbarIcon(String namaicon, {double? width}) {
    return Image.asset(
      'assets/icon_appbar/$namaicon.png',
      width: width,
      height: 25,
    );
  }

  static Image registerIcon(String namaicon, {double? width}) {
    return Image.asset(
      'assets/icon_register/$namaicon.png',
      width: width,
      color: Warna().font,
      height: 20,
    );
  }

  static Image onboarding(String image, {double? height}) {
    return Image.asset(
      'assets/onboarding/$image.png',
      height: height,
    );
  }
}
