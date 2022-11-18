import 'package:flutter/material.dart';
import 'package:thrilogic_shop/services/styles.dart';

class Assets {
  static Image navbarIcon(String namaicon) {
    return Image.asset(
      'assets/icon_navbar/$namaicon.png',
      color: Warna().icon,
      cacheHeight: 25,
      height: 25,
    );
  }

  static Image lainnyaIcon(String namaicon, {Color? color}) {
    return Image.asset(
      'assets/icon_lainnya/$namaicon.png',
      color: color,
      cacheHeight: 20,
      height: 20,
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
      cacheHeight: 25,
      height: 25,
    );
  }

  static Image registerIcon(String namaicon, {double? width}) {
    return Image.asset(
      'assets/icon_register/$namaicon.png',
      width: width,
      color: Warna().font,
      cacheHeight: 20,
      height: 20,
    );
  }

  static Image onboarding(String image) {
    return Image.asset(
      'assets/onboarding/$image.png',
    );
  }
}
