import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/pages/roni/splashscreen.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Notifikasi.flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(Notifikasi.channel);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Cart(),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThriLogic',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: Storages().ready(),
        builder: (
          BuildContext context,
          AsyncSnapshot<bool> snapshotLocalStorage,
        ) {
          if (snapshotLocalStorage.data == true) {
            return const SplashScreen();
          } else {
            return Container(
              color: Warna().first,
            );
          }
        },
      ),
    );
  }
}
