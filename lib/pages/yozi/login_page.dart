import 'package:flutter/material.dart';
import 'package:thrilogic_shop/services/responsive.dart';
import 'package:thrilogic_shop/pages/yozi/login/login_form.dart';
import 'package:thrilogic_shop/pages/yozi/login/login_screen_top_image.dart';
import 'package:thrilogic_shop/services/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Warna().primer,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const LoginScreenTopImage(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
