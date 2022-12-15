// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/pages/delvy/pembayaran_page.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../API/object_class/keranjang.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({
    Key? key,
  }) : super(key: key);

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  // GetKategori kategori;
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    return Scaffold(
        backgroundColor: Warna().primer,
        appBar: AppBar(
          leading: BackButton(
            color: Warna().putih,
          ),
          elevation: 0,
          title: Text(
            "Keranjang",
            style: Font.style(color: Warna().putih),
          ),
          backgroundColor: Warna().first,
          foregroundColor: Warna().primer,
          centerTitle: false,
        ),
        body: FutureBuilder<GetKeranjang>(
            future: JsonFuture().getKeranjang(),
            builder: (context, snapshotGetKeranjang) {
              if (snapshotGetKeranjang.hasData &&
                  snapshotGetKeranjang.connectionState !=
                      ConnectionState.waiting &&
                  snapshotGetKeranjang.data != null) {
                if (snapshotGetKeranjang.data!.data != null) {
                  List<DataGetKeranjang> datakeranjang =
                      snapshotGetKeranjang.data!.data!;
                  int total = 0;
                  datakeranjang.map(
                    (e) {
                      int harga = e.product!.harga!;
                      int quantity = e.qty!;
                      int totalsementara = harga * quantity;
                      total += totalsementara;
                      return total;
                    },
                  ).toList();
                  return datakeranjang.isEmpty
                      ? Center(child: lottieAsset('error'))
                      : Column(
                          children: [
                            Expanded(
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Total Keranjang ( ${datakeranjang.length} )",
                                        style: Font.style(
                                            fontWeight: FontWeight.bold,
                                            color: Warna().font,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: datakeranjang.length,
                                      itemBuilder: (context, index) {
                                        DataGetKeranjang keranjang =
                                            datakeranjang[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              WaveTransition(
                                                duration: const Duration(
                                                    milliseconds: 700),
                                                child: ProdukPage(
                                                    id: datakeranjang[index]
                                                        .productId!),
                                                center: const FractionalOffset(
                                                    0.5, 0),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 2,
                                            ),
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            color: Warna().primerCard,
                                            shadowColor: Warna().shadow,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 20,
                                              ),
                                              child: Row(
                                                children: [
                                                  Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image(
                                                        width: 60,
                                                        height: 60,
                                                        image: NetworkImage(
                                                            keranjang.product!
                                                                .image!),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            keranjang
                                                                .product!.name!,
                                                            style: Font.style(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 17,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              FutureBuilder<
                                                                  GetKategoriById>(
                                                                future: JsonFuture()
                                                                    .getKategoriById(
                                                                  id: keranjang
                                                                      .product!
                                                                      .categoryId
                                                                      .toString(),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  if (snapshot
                                                                          .hasData &&
                                                                      snapshot.connectionState !=
                                                                          ConnectionState
                                                                              .waiting &&
                                                                      snapshot.data !=
                                                                          null &&
                                                                      snapshot.data!
                                                                              .data !=
                                                                          null) {
                                                                    return Text(
                                                                      snapshot
                                                                              .data!
                                                                              .data!
                                                                              .name ??
                                                                          'No Kategori',
                                                                      style: Font
                                                                          .style(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Text(
                                                                      'Waiting..',
                                                                      style: Font.style(
                                                                          fontSize:
                                                                              12),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                              Text(
                                                                "${keranjang.qty!} pcs",
                                                                style:
                                                                    Font.style(
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            rupiah(
                                                              keranjang.product!
                                                                  .harga!,
                                                            ),
                                                            style: Font.style(
                                                                color: Warna()
                                                                    .font,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons
                                                          .delete_outline_rounded,
                                                      color: Colors.grey,
                                                      size: 25,
                                                    ),
                                                    onPressed: () async {
                                                      DeleteKeranjang
                                                          deleteKeranjang =
                                                          await JsonFuture()
                                                              .deleteKeranjang(
                                                        id: keranjang.id!
                                                            .toString(),
                                                      );
                                                      if (deleteKeranjang
                                                              .code ==
                                                          '00') {
                                                        cart.removecart = 1;
                                                        await Notifikasi.notif(
                                                            title:
                                                                'Hapus Keranjang',
                                                            body:
                                                                deleteKeranjang
                                                                    .info!);
                                                      }
                                                      snackBar(
                                                        context,
                                                        text: deleteKeranjang
                                                                .info ??
                                                            "TERJADI KESALAHAN",
                                                      );
                                                      setState(() {});
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              color: Warna().primerCard,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Total ",
                                            style: Font.style(
                                                fontWeight: FontWeight.bold,
                                                color: Warna().font,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            "( ${datakeranjang.length} Produk )",
                                            style: Font.style(
                                              // fontWeight: FontWeight.bold,
                                              color: Warna().font,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        rupiah(total),
                                        style: Font.style(
                                          fontWeight: FontWeight.bold,
                                          color: Warna().font,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          WaveTransition(
                                            duration: const Duration(
                                                milliseconds: 700),
                                            child: PembayaranPage(
                                                dataKeranjang:
                                                    snapshotGetKeranjang.data!,
                                                total: total),
                                            center:
                                                const FractionalOffset(0.5, 0),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            const EdgeInsets.symmetric(
                                                vertical: 15)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Warna().icon),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Beli Semua",
                                        style: Font.style(
                                            fontSize: 18, color: Warna().putih),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                } else {
                  return Center(
                    child: lottieAsset(
                      'error',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Warna().terang,
                  ),
                );
              }
            }));
  }
}
