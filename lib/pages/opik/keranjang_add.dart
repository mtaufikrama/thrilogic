// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';

class KeranjangAdd extends StatefulWidget {
  KeranjangAdd({
    super.key,
    required this.index,
    required this.listProducts,
  });
  int index;
  List<ProductsGetKategoriById> listProducts;

  @override
  State<KeranjangAdd> createState() => _KeranjangAddState();
}

class _KeranjangAddState extends State<KeranjangAdd> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetKeranjang>(
      future: JsonFuture().getKeranjang(),
      builder: (context, snapshotGetKeranjang) {
        if (snapshotGetKeranjang.hasData &&
            snapshotGetKeranjang.connectionState != ConnectionState.waiting &&
            snapshotGetKeranjang.connectionState != ConnectionState.none &&
            snapshotGetKeranjang.data != null) {
          return snapshotGetKeranjang.data!.data != null
              ? snapshotGetKeranjang.data!.data!
                          .map((e) => e.productId)
                          .contains(widget.listProducts[widget.index].id) !=
                      true
                  ? GestureDetector(
                      onTap: () async {
                        CreateKeranjang keranjang = await JsonFuture()
                            .createKeranjang(
                                productId: widget.listProducts[widget.index].id
                                    .toString(),
                                qty: "1");
                        await Storages().setAddCart();
                        snackBar(
                          context,
                          text: keranjang.info ??
                              keranjang.message ??
                              "TERJADI KESALAHAN",
                        );
                        setState(() {});
                      },
                      child: Assets.lainnyaIcon('tambah'),
                    )
                  : Icon(
                      Icons.done_outline_rounded,
                      color: Warna().font,
                    )
              : Text(
                  "err",
                  style: Font.style(color: Warna().shadow),
                );
        } else {
          return Container(
            width: 10,
          );
        }
      },
    );
  }
}
