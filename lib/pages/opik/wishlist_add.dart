// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/pages/opik/splash_login.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class WishlistAdd extends StatefulWidget {
  WishlistAdd({
    super.key,
    required this.id,
  });
  int id;

  @override
  State<WishlistAdd> createState() => _WishlistAddState();
}

class _WishlistAddState extends State<WishlistAdd> {
  String nama = Storages.getName();
  @override
  Widget build(BuildContext context) {
    return nama.isEmpty
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                WaveTransition(
                  duration: const Duration(milliseconds: 700),
                  child: const SplashLogin(),
                  center: const FractionalOffset(0.5, 0),
                ),
              );
            },
            child: Assets.navbarIcon('heart'),
          )
        : FutureBuilder<GetWishlist>(
            future: JsonFuture().getWishlist(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting &&
                  snapshot.data != null) {
                return GestureDetector(
                  onTap: () async {
                    if (snapshot.data!.data!
                            .map(
                              (e) => e.product != null ? e.product!.id : {},
                            )
                            .contains(
                              widget.id,
                            ) !=
                        true) {
                      CreateWishlist wishlist = await JsonFuture()
                          .createWishlist(productId: widget.id.toString());
                      snackBar(context,
                          text: wishlist.info ??
                              wishlist.message ??
                              "TERJADI KESALAHAN");
                      setState(() {});
                    }
                  },
                  child: snapshot.data!.data != null
                      ? Assets.navbarIcon(
                          snapshot.data!.data!
                                  .map(
                                    (e) =>
                                        e.product != null ? e.product!.id : {},
                                  )
                                  .contains(
                                    widget.id,
                                  )
                              ? 'hearton'
                              : 'heart',
                        )
                      : Text(
                          'err',
                          style: Font.style(color: Warna().shadow),
                        ),
                );
              } else {
                return Center(
                  child: Container(),
                );
              }
            },
          );
  }
}
