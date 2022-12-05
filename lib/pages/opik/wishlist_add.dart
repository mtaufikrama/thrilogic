// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/styles.dart';

class WishlistAdd extends StatefulWidget {
  WishlistAdd({
    super.key,
    required this.index,
    required this.listProducts,
  });
  int index;
  List<ProductsGetKategoriById> listProducts;

  @override
  State<WishlistAdd> createState() => _WishlistAddState();
}

class _WishlistAddState extends State<WishlistAdd> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetWishlist>(
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
                        widget.listProducts[widget.index].id,
                      ) !=
                  true) {
                CreateWishlist wishlist = await JsonFuture().createWishlist(
                    productId:
                        widget.listProducts[widget.index].id!.toString());
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
                              (e) => e.product != null ? e.product!.id : {},
                            )
                            .contains(
                              widget.listProducts[widget.index].id,
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
