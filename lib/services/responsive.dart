import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

responsive(
  BuildContext context, {
  required dynamic mobile,
  required dynamic desktop,
  dynamic tablet,
  dynamic iOS,
  dynamic macOS,
}) {
  final String orientation = MediaQuery.of(context).orientation.name;
  final double width = MediaQuery.of(context).size.width;
  if (kIsWeb || Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    if (width <= 850.toDouble()) {
      return mobile;
    } else if (width <= 1100.toDouble()) {
      return tablet ?? desktop;
    } else {
      return desktop;
    }
  } else {
    if (Platform.isAndroid) {
      if (orientation == 'landscape') {
        return tablet ?? desktop;
      } else {
        return mobile;
      }
    } else if (Platform.isIOS) {
      if (orientation == 'landscape') {
        return macOS ?? tablet ?? iOS ?? desktop;
      } else {
        return iOS ?? mobile;
      }
    }
  }
}
