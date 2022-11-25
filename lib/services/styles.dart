import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:thrilogic_shop/services/local_storages.dart';

class Warna {
  bool nightmode = Storages.getNightMode();
  Color get first => const Color.fromRGBO(166, 87, 55, 1);
  Color get second => const Color.fromARGB(255, 147, 128, 128);
  Color get third => const Color.fromARGB(255, 203, 191, 191);
  Color get primer => nightmode == false
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromRGBO(30, 30, 30, 1);
  Color get primerCard => nightmode == false
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromARGB(255, 42, 42, 42);
  Color get font => nightmode == false
      ? const Color.fromRGBO(30, 30, 30, 1)
      : const Color.fromARGB(255, 180, 180, 180);
  Color get icon => nightmode == false
      ? const Color.fromRGBO(166, 87, 55, 1)
      : const Color.fromRGBO(255, 110, 42, 1);
  Color get shadow => nightmode == false
      ? const Color.fromARGB(255, 206, 206, 206)
      : const Color.fromARGB(255, 68, 68, 68);
}

class Font {
  static TextStyle style({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        color: color ?? Warna().font,
        wordSpacing: 2,
        fontWeight: fontWeight,
      );
}

dynamic rupiah(num number) => NumberFormat.currency(
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(number);
