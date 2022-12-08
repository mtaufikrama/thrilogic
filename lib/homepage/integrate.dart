// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/homepage/homepage.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class IntegrateAPI extends StatefulWidget {
  const IntegrateAPI({super.key});

  @override
  State<IntegrateAPI> createState() => _IntegrateAPIState();
}

class _IntegrateAPIState extends State<IntegrateAPI> {
  List<String> listIdKategori = [
    '34',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '47',
    '48',
    '49',
  ];
  List<DataGetKategoriById> listDataKategori = [];
  List<ProductsGetKategoriById> listProducts = [];
  Future<void>? addcart;

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    return Scaffold(
      backgroundColor: Warna().terang,
      body: FutureBuilder<GetKeranjang>(
        future: JsonFuture().getKeranjang(),
        builder: (context, snapshotGetKeranjang) {
          if (snapshotGetKeranjang.hasData &&
              snapshotGetKeranjang.connectionState != ConnectionState.waiting &&
              snapshotGetKeranjang.data != null &&
              snapshotGetKeranjang.data!.data != null) {
            if (listDataKategori.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: listIdKategori.map((e) {
                  return FutureBuilder<GetKategoriById>(
                    future: JsonFuture().getKategoriById(id: e),
                    builder: (context, snapshotGetKategoriById) {
                      if (snapshotGetKategoriById.hasData &&
                          snapshotGetKategoriById.connectionState !=
                              ConnectionState.waiting &&
                          snapshotGetKategoriById.data != null &&
                          snapshotGetKategoriById.data!.data != null) {
                        listDataKategori
                            .add(snapshotGetKategoriById.data!.data!);
                        listProducts.addAll(
                            snapshotGetKategoriById.data!.data!.products!);
                        if (listDataKategori.length == listIdKategori.length) {
                          listProducts.shuffle();
                          return GestureDetector(
                            onTap: () async {
                              cart.cart =
                                  snapshotGetKeranjang.data!.data!.length;
                              Navigator.pushReplacement(
                                context,
                                WaveTransition(
                                  duration: const Duration(milliseconds: 1000),
                                  child: HomePage(
                                    listProducts: listProducts,
                                    listDataKategori: listDataKategori,
                                    getkeranjang: snapshotGetKeranjang.data!,
                                    selectedIndex: 0,
                                  ),
                                  center: const FractionalOffset(0.5, 0.5),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Warna().first,
                              child: Center(
                                child: Text(
                                  'TAP SCREEN',
                                  style: Font.style(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    },
                  );
                }).toList(),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const IntegrateAPI(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Warna().first,
                  child: Center(
                    child: Text(
                      'DATA GAGAL DI PROSES',
                      style: Font.style(color: Colors.white),
                    ),
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
