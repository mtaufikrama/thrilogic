import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thrilogic_shop/pages/roni/splashscreen.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
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
      title: 'THRILOGIC SHOP',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: Storages().ready(),
        builder:
            (BuildContext context, AsyncSnapshot<bool> snapshotLocalStorage) {
          if (snapshotLocalStorage.data == true) {
            print(Storages.getToken());
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
