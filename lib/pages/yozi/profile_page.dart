import 'package:flutter/material.dart';
import 'package:thrilogic_shop/pages/opik/splash_login.dart';
import 'package:thrilogic_shop/services/local_storages.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String nama = Storages.getName();

  @override
  Widget build(BuildContext context) {
    return SplashLogin();
  }
}
