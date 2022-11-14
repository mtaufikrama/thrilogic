import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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
  void initState() {
    Future.delayed(const Duration(minutes: 1)).then((value) {
      setState(() {});
    });
    super.initState();
  }

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
                              snapshotGetTransaksi.hasData) {
                            return HomePage(
                              getbarang: snapshotGetBarang.data!,
                              getkategori: snapshotGetKategori.data!,
                              getkeranjang: snapshotGetKeranjang.data!,
                              gettransaksi: snapshotGetTransaksi.data!,
                              getwishlist: snapshotGetWishlist.data!,
                              selectedIndex: 0,
                            );
                          } else {
                            return Center(
                              child: Shimmer.fromColors(
                                baseColor:
                                    const Color.fromARGB(255, 114, 114, 114),
                                highlightColor: Colors.grey,
                                enabled: true,
                                child: ListView.builder(
                                  itemCount: 6,
                                  itemBuilder: (_, __) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 48.0,
                                          height: 48.0,
                                          color: Colors.white,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: double.infinity,
                                                height: 8.0,
                                                color: Colors.white,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2.0),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 8.0,
                                                color: Colors.white,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2.0),
                                              ),
                                              Container(
                                                width: 40.0,
                                                height: 8.0,
                                                color: Colors.white,
                                              ),
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
