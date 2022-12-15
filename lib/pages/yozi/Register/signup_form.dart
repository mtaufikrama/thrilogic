// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/auth.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:wave_transition/wave_transition.dart';
import '../../../services/already_have_an_account_acheck.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:thrilogic_shop/pages/yozi/login_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController nama = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController notelp = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController konfirmasi = TextEditingController();

  bool boolpassword = true;

  bool boolkonfirmasi = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: nama,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: Warna().font,
            style: Font.style(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Masukan nama kamu",
              hintStyle: Font.style(fontSize: 16, color: Colors.grey),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Assets.registerIcon('profile'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: email,
              style: Font.style(),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: Warna().font,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Masukan email kamu",
                hintStyle: Font.style(fontSize: 16, color: Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Assets.registerIcon('sms'),
                ),
              ),
            ),
          ),
          TextFormField(
            controller: notelp,
            style: Font.style(),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            cursorColor: Warna().font,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Masukan No.Tlpn kamu",
              hintStyle: Font.style(fontSize: 16, color: Colors.grey),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Assets.registerIcon('call'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              style: Font.style(),
              controller: password,
              textInputAction: TextInputAction.next,
              obscureText: boolpassword,
              cursorColor: Warna().font,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Masukan password",
                hintStyle: Font.style(fontSize: 16, color: Colors.grey),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Assets.registerIcon('lock'),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      boolpassword = !boolpassword;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child:
                        Assets.registerIcon(!boolpassword ? 'eye' : 'eyeoff'),
                  ),
                ),
              ),
            ),
          ),
          TextFormField(
            style: Font.style(),
            controller: konfirmasi,
            textInputAction: TextInputAction.next,
            obscureText: boolkonfirmasi,
            cursorColor: Warna().font,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Konfirmasi password",
              hintStyle: Font.style(fontSize: 16, color: Colors.grey),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Assets.registerIcon('lock'),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    boolkonfirmasi = !boolkonfirmasi;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child:
                      Assets.registerIcon(!boolkonfirmasi ? 'eye' : 'eyeoff'),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () async {
              Register register = await JsonFuture().register(
                name: nama.text,
                email: email.text,
                handphone: notelp.text,
                password: password.text,
                passwordConfirmation: konfirmasi.text,
              );
              snackBar(context, text: register.info!);
              if (register.code == '00') {
                await Storages().setEmail(email: email.text);
                await Storages().setPassword(password: password.text);
                await Notifikasi.notif(
                  title: 'Daftar Akun',
                  body:
                      'Daftar dengan Email ${register.data!.user!.email} Berhasil',
                );
                Navigator.pushReplacement(
                  context,
                  WaveTransition(
                    duration: const Duration(milliseconds: 700),
                    center: const FractionalOffset(0.9, 0.0),
                    child: const LoginScreen(),
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
              "Sign Up".toUpperCase(),
              style: Font.style(
                fontSize: 15,
                color: Warna().putih,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.pushReplacement(
                context,
                WaveTransition(
                  duration: const Duration(milliseconds: 700),
                  center: const FractionalOffset(0.9, 0.0),
                  child: const LoginScreen(),
                ),
              );
            },
          ),
          const SizedBox(
            height: defaultPadding * 2,
          ),
        ],
      ),
    );
  }
}
