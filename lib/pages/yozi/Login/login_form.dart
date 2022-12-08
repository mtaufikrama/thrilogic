// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/auth.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/services/styles.dart';
//import 'package:thrilogic_shop/homepage/homepage.dart';
import 'package:thrilogic_shop/pages/yozi/register_page.dart';
import 'package:wave_transition/wave_transition.dart';
import '../../../services/already_have_an_account_acheck.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = true;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Warna().font,
            style: Font.style(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Masukan email kamu",
              hintStyle: Font.style(fontSize: 16),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Assets.registerIcon('sms'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: password,
              textInputAction: TextInputAction.done,
              obscureText: obscureText,
              cursorColor: Warna().first,
              style: Font.style(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Masukan password",
                hintStyle: Font.style(fontSize: 16),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Assets.registerIcon(
                        obscureText != true ? 'eye' : 'eyeoff'),
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Assets.registerIcon('lock'),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                Login login = await JsonFuture()
                    .login(email: email.text, password: password.text);
                snackBar(context, text: login.info!);
                if (login.code == '00') {
                  Navigator.pushReplacement(
                    context,
                    WaveTransition(
                      duration: const Duration(milliseconds: 700),
                      child: const IntegrateAPI(),
                      center: const FractionalOffset(0.5, 0),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                backgroundColor: Warna().icon,
                fixedSize: const Size(500, 50),
              ),
              child: Text(
                "Masuk".toUpperCase(),
                style: Font.style(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                WaveTransition(
                  duration: const Duration(milliseconds: 700),
                  child: const SignUpScreen(),
                  center: const FractionalOffset(0.5, 0),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
