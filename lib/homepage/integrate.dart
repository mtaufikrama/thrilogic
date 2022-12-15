// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/homepage/homepage.dart';
import 'package:thrilogic_shop/pages/roni/Splashscreen.dart';
import 'package:thrilogic_shop/pages/yozi/login_page.dart';
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
  int time = 0;
  Timer? times;
  // GetBarang? cekmessage;

  @override
  void dispose() {
    times!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    times = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        time = timer.tick;
        print(time);
        if (time == 15) {
          timer.cancel();
          setState(() {});
        }
      },
    );
    super.initState();
  }

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
                          times!.cancel();
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
            if (time >= 15) {
              times!.cancel();
              return Center(
                child: AlertDialog(
                  backgroundColor: Warna().primerCard,
                  content: Text(
                    'Data Gagal diproses',
                    style: Font.style(),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    IconButton(
                      tooltip: 'Instal Ulang Aplikasi',
                      onPressed: () async {
                        times!.cancel();
                        await JsonFuture().logout();
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: const SplashScreen(),
                            center: const FractionalOffset(0.5, 0.5),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.install_mobile_rounded,
                        color: Warna().icon,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Login Kembali',
                      onPressed: () async {
                        times!.cancel();
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: const LoginScreen(),
                            center: const FractionalOffset(0.5, 0.5),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.login_rounded,
                        color: Warna().icon,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Restart Aplikasi',
                      onPressed: () async {
                        times!.cancel();
                        await JsonFuture().logout();
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: const IntegrateAPI(),
                            center: const FractionalOffset(0.5, 0.5),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.restart_alt_rounded,
                        color: Warna().icon,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Stack(
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  if (time == 10)
                    Center(
                      child: Text('Loading is a taking too long'),
                    )
                ],
              );
            }
          }
        },
      ),
    );
  }
}
