import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/pages/yozi/selesai_pembayaran.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../services/styles.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({
    Key? key,
  }) : super(key: key);

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  String nama = Storages.getName();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      body: FutureBuilder<GetTransaksi>(
          future: JsonFuture().getTransaksi(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState != ConnectionState.waiting &&
                snapshot.data != null &&
                snapshot.data!.data != null) {
              List<DataGetTransaksi> listdatareview = snapshot.data!.data!;
              return listdatareview.isEmpty
                  ? Center(
                      child: lottieAsset('error'),
                    )
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(height: 15),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: listdatareview.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            DataGetTransaksi datareview = listdatareview[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  WaveTransition(
                                    duration: const Duration(milliseconds: 700),
                                    center: const FractionalOffset(0.5, 0.0),
                                    child: SelesaiPembayaranPage(
                                        datatransaksi: datareview),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    width: double.maxFinite,
                                    // height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Warna().primerCard,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withAlpha(50),
                                            blurRadius: 2.0),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: datareview.products != null
                                              ? datareview.products!.length
                                              : 0,
                                          itemBuilder:
                                              (context, indexProducts) {
                                            ProductsGetTransaksi
                                                productsGetTransaksi =
                                                datareview
                                                    .products![indexProducts];
                                            return Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ListTile(
                                                leading: AspectRatio(
                                                  aspectRatio: 1,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      productsGetTransaksi
                                                          .image!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                title: Text(
                                                  productsGetTransaksi.name!,
                                                  textAlign: TextAlign.justify,
                                                  style: Font.style(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FutureBuilder<
                                                            GetKategoriById>(
                                                          future: JsonFuture()
                                                              .getKategoriById(
                                                            id: productsGetTransaksi
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
                                                                style:
                                                                    Font.style(
                                                                  fontSize: 12,
                                                                ),
                                                              );
                                                            } else {
                                                              return Text(
                                                                'Waiting..',
                                                                style:
                                                                    Font.style(
                                                                  fontSize: 12,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                        Text(
                                                          productsGetTransaksi
                                                                      .pivot !=
                                                                  null
                                                              ? "${productsGetTransaksi.pivot!.qty!} pcs"
                                                              : 'data tidak ditemukan',
                                                          style: Font.style(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          productsGetTransaksi
                                                              .updatedAt!
                                                              .substring(0, 10),
                                                          style: Font.style(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                        Text(
                                                          rupiah(
                                                            productsGetTransaksi
                                                                .harga!,
                                                          ),
                                                          style: Font.style(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Divider(
                                          thickness: 2,
                                          endIndent: 20,
                                          indent: 20,
                                          color: Color.fromARGB(
                                              255, 230, 230, 230),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              right: 20,
                                              left: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Assets.lainnyaIcon(
                                                            "delivery"),
                                                        const SizedBox(
                                                            width: 15),
                                                        Text(
                                                          "Reguler - MeTiR Fast",
                                                          style: Font.style(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        Assets.lainnyaIcon(
                                                            "maps"),
                                                        const SizedBox(
                                                            width: 15),
                                                        Text(
                                                          "Jakarta Timur",
                                                          style: Font.style(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    datareview.status!
                                                        .toUpperCase(),
                                                    style: Font.style(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    rupiah(datareview.total!),
                                                    style: Font.style(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 30),
                      ],
                    );
            } else {
              return Center(
                child: CircularProgressIndicator(color: Warna().terang),
              );
            }
          }),
    );
  }
}
