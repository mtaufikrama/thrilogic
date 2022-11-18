import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/homepage/homepage.dart';

class IntegrateAPI extends StatefulWidget {
  const IntegrateAPI({super.key});

  @override
  State<IntegrateAPI> createState() => _IntegrateAPIState();
}

class _IntegrateAPIState extends State<IntegrateAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetBarang>(
        future: JsonFuture().getBarang(),
        builder: (context, snapshotGetBarang) {
          return FutureBuilder<GetKategori>(
            future: JsonFuture().getKategori(),
            builder: (context, snapshotGetKategori) {
              return FutureBuilder<GetKeranjang>(
                future: JsonFuture().getKeranjang(),
                builder: (context, snapshotGetKeranjang) {
                  return FutureBuilder<GetTransaksi>(
                    future: JsonFuture().getTransaksi(),
                    builder: (context, snapshotGetTransaksi) {
                      return FutureBuilder<GetWishlist>(
                        future: JsonFuture().getWishlist(),
                        builder: (context, snapshotGetWishlist) {
                          if (snapshotGetWishlist.hasData &&
                              snapshotGetBarang.hasData &&
                              snapshotGetKategori.hasData &&
                              snapshotGetKeranjang.hasData &&
                              snapshotGetTransaksi.hasData &&
                              snapshotGetWishlist.connectionState !=
                                  ConnectionState.waiting &&
                              snapshotGetBarang.connectionState !=
                                  ConnectionState.waiting &&
                              snapshotGetKategori.connectionState !=
                                  ConnectionState.waiting &&
                              snapshotGetKeranjang.connectionState !=
                                  ConnectionState.waiting &&
                              snapshotGetTransaksi.connectionState !=
                                  ConnectionState.waiting &&
                              snapshotGetWishlist.data != null &&
                              snapshotGetBarang.data != null &&
                              snapshotGetKategori.data != null &&
                              snapshotGetKeranjang.data != null &&
                              snapshotGetTransaksi.data != null) {
                            print(snapshotGetBarang.hasData);
                            print(snapshotGetBarang.data!.toJson().values);
                            print(snapshotGetBarang.connectionState);
                            return HomePage(
                              getbarang: snapshotGetBarang.data!,
                              getkategori: snapshotGetKategori.data!,
                              getkeranjang: snapshotGetKeranjang.data!,
                              gettransaksi: snapshotGetTransaksi.data!,
                              getwishlist: snapshotGetWishlist.data!,
                              selectedIndex: 0,
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
              );
            },
          );
        },
      ),
    );
  }
}
