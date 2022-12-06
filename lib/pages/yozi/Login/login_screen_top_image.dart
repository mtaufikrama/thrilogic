import 'package:flutter/material.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding * 10),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Assets.logo(
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Text(
          "Silakan masukan alamat email kamu dan masukan kata sandi",
          textAlign: TextAlign.center,
          style: Font.style(fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.clip,
        ),
        const SizedBox(height: defaultPadding * 3),
      ],
    );
  }
}
