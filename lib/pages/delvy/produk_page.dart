// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/pages/delvy/create_produk_page.dart';
import 'package:thrilogic_shop/pages/delvy/keranjang_page.dart';
import 'package:thrilogic_shop/pages/opik/splash_login.dart';
import 'package:thrilogic_shop/pages/opik/star_penjual.dart';
import 'package:thrilogic_shop/pages/opik/wishlist_add.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class ProdukPage extends StatefulWidget {
  ProdukPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  int id;

  @override
  State<ProdukPage> createState() => _ProdukPage();
}

class _ProdukPage extends State<ProdukPage> {
  String nama = Storages.getName();
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Warna().primer,
        extendBodyBehindAppBar: true,
        body: FutureBuilder<GetBarangById>(
            future: JsonFuture().getBarangById(id: widget.id.toString()),
            builder: (context, snapshotBarang) {
              if (snapshotBarang.hasData &&
                  snapshotBarang.connectionState != ConnectionState.waiting &&
                  snapshotBarang.data != null) {
                if (snapshotBarang.data!.data != null) {
                  DataGetBarangById databarang = snapshotBarang.data!.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Image(
                                            image:
                                                NetworkImage(databarang.image!),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(25),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image(
                                        image: NetworkImage(databarang.image!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BackButton(
                                        color: Warna().icon,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: WishlistAdd(
                                              id: widget.id,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          databarang.name!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Font.style(
                                              fontWeight: FontWeight.bold,
                                              color: Warna().font,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text(
                                        rupiah(databarang.harga!),
                                        style: Font.style(
                                            fontWeight: FontWeight.bold,
                                            color: Warna().font,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  ReviewStar(
                                    id: widget.id,
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    "Detail Produk",
                                    style: Font.style(
                                        fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Stok",
                                            textAlign: TextAlign.justify,
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Kategori",
                                            textAlign: TextAlign.justify,
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ": ${databarang.stock!}",
                                            textAlign: TextAlign.justify,
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            ": ${databarang.category!.name!}",
                                            textAlign: TextAlign.justify,
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    "Deskripsi Produk",
                                    style: Font.style(
                                        fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    databarang.deskripsi!,
                                    textAlign: TextAlign.justify,
                                    maxLines: 5,
                                    overflow: TextOverflow.fade,
                                    style: Font.style(
                                        color: Warna().font, fontSize: 15),
                                  ),
                                  GestureDetector(
                                    onTap: () => showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => makeDismisibble(
                                        child: DraggableScrollableSheet(
                                          initialChildSize: 0.6,
                                          minChildSize: 0.3,
                                          maxChildSize: 0.6,
                                          builder: (_, contoller) => Container(
                                            decoration: BoxDecoration(
                                                color: Warna().primerCard,
                                                borderRadius: const BorderRadius
                                                        .vertical(
                                                    top: Radius.circular(20))),
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15, top: 15),
                                            child: ListView(
                                              controller: contoller,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        databarang.name!,
                                                        style: Font.style(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 30),
                                                    Text(
                                                      "Deskripsi",
                                                      style: Font.style(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                    Text(
                                                      databarang.deskripsi!,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: Font.style(
                                                          fontSize: 15),
                                                    ),
                                                    const SizedBox(height: 15)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Baca selengkapnya...",
                                      style: Font.style(
                                        fontSize: 12,
                                        color: Warna().icon,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      nama == 'admin'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          WaveTransition(
                                            duration: const Duration(
                                                milliseconds: 700),
                                            child: CreateUpdateProdukPage(
                                              id: databarang.id,
                                              image: databarang.image,
                                              category_id: databarang.categoryId
                                                  .toString(),
                                              deskripsi: databarang.deskripsi,
                                              harga:
                                                  databarang.harga.toString(),
                                              name: databarang.name,
                                              stock:
                                                  databarang.stock.toString(),
                                            ),
                                            center:
                                                const FractionalOffset(0.5, 0),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                            vertical: 15,
                                          ),
                                        ),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Warna().icon),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                const BorderRadius.horizontal(
                                              left: Radius.circular(50),
                                            ),
                                            side:
                                                BorderSide(color: Warna().icon),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "PERBARUI",
                                        style: Font.style(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: TextButton(
                                      onPressed: () async {
                                        DeleteBarang deleteBarang =
                                            await JsonFuture().deleteBarang(
                                          id: widget.id.toString(),
                                        );
                                        snackBar(
                                          context,
                                          text: deleteBarang.info ??
                                              'TERJADI KESALAHAN',
                                        );
                                        if (deleteBarang.code == '00')
                                          Navigator.pushReplacement(
                                            context,
                                            WaveTransition(
                                              duration: const Duration(
                                                  milliseconds: 700),
                                              child: ProdukPage(id: widget.id),
                                              center: const FractionalOffset(
                                                  0.5, 0.5),
                                            ),
                                          );
                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                            vertical: 15,
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 3, color: Warna().icon),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "HAPUS",
                                        style: Font.style(
                                          fontSize: 18,
                                          color: Warna().icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                onPressed: () async {
                                  if (nama.isEmpty) {
                                    Navigator.push(
                                      context,
                                      WaveTransition(
                                        duration:
                                            const Duration(milliseconds: 700),
                                        child:
                                            const SplashLogin(navigate: true),
                                        center: const FractionalOffset(0.5, 0),
                                      ),
                                    );
                                  } else {
                                    CreateKeranjang keranjang =
                                        await JsonFuture().createKeranjang(
                                      productId: widget.id.toString(),
                                      qty: "1",
                                    );
                                    snackBar(
                                      context,
                                      text: keranjang.info ??
                                          keranjang.message ??
                                          'TERJADI KESALAHAN',
                                    );
                                    if (keranjang.code == '00') {
                                      cart.addcart = 1;
                                      Navigator.push(
                                        context,
                                        WaveTransition(
                                          duration:
                                              const Duration(milliseconds: 700),
                                          child: const Keranjang(),
                                          center:
                                              const FractionalOffset(0.5, 0),
                                        ),
                                      );
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Warna().icon),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: BorderSide(
                                        color: Warna().icon,
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "TAMBAH KE KERANJANG",
                                  style: Font.style(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: lottieAsset('error'),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Warna().terang,
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget makeDismisibble({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );
}
