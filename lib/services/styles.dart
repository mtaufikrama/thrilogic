import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:thrilogic_shop/services/local_storages.dart';

class Warna {
  bool nightmode = Storages.getNightMode();
  Color get first => const Color.fromARGB(255, 91, 66, 66);
  Color get second => const Color.fromARGB(255, 147, 128, 128);
  Color get third => const Color.fromARGB(255, 203, 191, 191);
  Color get primer => nightmode == false
      ? const Color.fromARGB(255, 255, 255, 255)
      : Colors.black;
  Color get primerCard => nightmode == false
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromARGB(255, 91, 66, 66);
  Color get font => nightmode == false
      ? Colors.black
      : const Color.fromARGB(255, 147, 128, 128);
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
