import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/services/local_storages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
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
            return const IntegrateAPI();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
