import 'package:flutter/material.dart';

class Assets {
  static Image navbarIcon(String namaicon) {
    return Image.asset(
      'assets/icon_navbar/$namaicon.png',
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
    );
  }

  static Image registerIcon(String namaicon, {double? width}) {
    return Image.asset(
      'assets/icon_register/$namaicon.png',
      width: width,
    );
  }

  static Image onboarding(String image) {
    return Image.asset(
      'assets/onboarding/$image.png',
    );
  }
}
