import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:thrilogic_shop/services/local_storages.dart';

class Warna {
  bool nightmode = Storages.getNightMode();
  Color get terang => const Color.fromRGBO(255, 110, 42, 1);
  Color get first => const Color.fromRGBO(166, 87, 55, 1);
  Color get second => const Color.fromARGB(255, 147, 128, 128);
  Color get putih => const Color.fromARGB(255, 180, 180, 180);

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
      : Colors.transparent;
}

class Font {
  static TextStyle style({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.poppins(
        fontSize: fontSize,
        color: color ?? Warna().font,
        wordSpacing: 2,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      );
}

dynamic rupiah(num number) => NumberFormat.currency(
      symbol: 'Rp',
      decimalDigits: 0,
    ).format(number);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
  BuildContext context, {
  required String text,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: Font.style(
          color: Warna().putih,
          fontSize: 15,
        ),
        textAlign: TextAlign.center,
      ),
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 40, top: 10),
      backgroundColor: Warna().first,
      duration: const Duration(seconds: 3),
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
    ),
  );
}

class Cart with ChangeNotifier {
  int _cart = 0;

  int get cart => _cart;

  set addcart(int value) {
    cart += value;
    notifyListeners();
  }

  set removecart(int value) {
    cart -= value;
    notifyListeners();
  }

  set cart(int value) {
    _cart = value;
    notifyListeners();
  }
}

LottieBuilder lottieAsset(
  String namafile, {
  Animation<double>? controller,
  double? width,
  void Function(LottieComposition)? onLoaded,
}) {
  return Lottie.asset(
    "assets/lottie/$namafile.json",
    controller: controller,
    width: width,
    onLoaded: onLoaded,
  );
}

class Notifikasi {
  static AndroidNotificationChannel channel = AndroidNotificationChannel(
    "id",
    "name",
    importance: Importance.high,
    playSound: true,
  );

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> notif({
    required String title,
    required String body,
  }) =>
      flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            importance: Importance.high,
            color: Warna().terang,
            playSound: true,
            icon: "@mipmap/application_icon",
          ),
        ),
      );
}

const double defaultPadding = 16.0;
