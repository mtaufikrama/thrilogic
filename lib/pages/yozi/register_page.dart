import 'package:flutter/material.dart';
import 'package:thrilogic_shop/services/responsive.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:thrilogic_shop/pages/yozi/Register/sign_up_top_image.dart';
import 'package:thrilogic_shop/pages/yozi/Register/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Warna().primer,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Responsive(
            mobile: const MobileSignupScreen(),
            desktop: Row(
              children: [
                const Expanded(
                  child: SignUpScreenTopImage(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: SignUpForm(),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SignUpScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: SignUpForm(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
