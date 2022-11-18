import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/homepage/homepage.dart';
import 'package:thrilogic_shop/services/styles.dart';

class IntegrateAPI extends StatefulWidget {
  const IntegrateAPI({super.key});

  @override
  State<IntegrateAPI> createState() => _IntegrateAPIState();
}

class _IntegrateAPIState extends State<IntegrateAPI> {
  List<String> listIdKategori = [
    '22',
    '23',
    '24',
    '25',
    '26',
  ];
  List<DataGetKategoriById> listDataKategori = [];
  List<ProductsGetKategoriById> listProducts = [];
  List check = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      body: FutureBuilder<GetKeranjang>(
        future: JsonFuture().getKeranjang(),
        builder: (context, snapshotGetKeranjang) {
          return FutureBuilder<GetTransaksi>(
            future: JsonFuture().getTransaksi(),
            builder: (context, snapshotGetTransaksi) {
              return FutureBuilder<GetWishlist>(
                future: JsonFuture().getWishlist(),
                builder: (context, snapshotGetWishlist) {
                  if (snapshotGetWishlist.hasData &&
                      snapshotGetKeranjang.hasData &&
                      snapshotGetTransaksi.hasData &&
                      snapshotGetWishlist.connectionState !=
                          ConnectionState.waiting &&
                      snapshotGetKeranjang.connectionState !=
                          ConnectionState.waiting &&
                      snapshotGetTransaksi.connectionState !=
                          ConnectionState.waiting &&
                      snapshotGetWishlist.data != null &&
                      snapshotGetKeranjang.data != null &&
                      snapshotGetTransaksi.data != null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: listIdKategori.map((e) {
                        return FutureBuilder(
                          future: JsonFuture().getKategoriById(id: e),
                          builder: (context, snapshotGetKategoriById) {
                            if (snapshotGetKategoriById.hasData &&
                                snapshotGetKategoriById.connectionState !=
                                    ConnectionState.waiting &&
                                snapshotGetKategoriById.data != null &&
                                snapshotGetKategoriById.data!.data != null) {
                              listDataKategori
                                  .add(snapshotGetKategoriById.data!.data!);
                              listProducts.addAll(snapshotGetKategoriById
                                  .data!.data!.products!);
                              check.add(e);
                              print(check);
                              if (check.length == listIdKategori.length) {
                                listProducts.shuffle();
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          listProducts: listProducts,
                                          listDataKategori: listDataKategori,
                                          getkeranjang:
                                              snapshotGetKeranjang.data!,
                                          gettransaksi:
                                              snapshotGetTransaksi.data!,
                                          getwishlist:
                                              snapshotGetWishlist.data!,
                                          selectedIndex: 0,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    color: Warna().second,
                                    child: Center(
                                      child: Text(
                                        'TAP SCREEN',
                                        style: Font.style(),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (check == []) {
                                return Center(
                                  child: Text(
                                    'DATA GAGAL DI PROSES',
                                    style: Font.style(color: Colors.red),
                                  ),
                                );
                              } else if (check.length < listIdKategori.length) {
                                return Container();
                              } else {
                                return Center(
                                  child: Text(
                                    'DUPLICATE DATA',
                                    style: Font.style(),
                                  ),
                                );
                              }
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const IntegrateAPI(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'DATA GAGAL DI PROSES',
                                    style: Font.style(),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
