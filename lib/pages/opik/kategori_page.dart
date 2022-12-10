// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/pages/opik/card_grid.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class KategoriPage extends StatelessWidget {
  KategoriPage({
    super.key,
    required this.id,
  });

  String id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            const Duration(milliseconds: 100),
            () {
              Navigator.pushReplacement(
                context,
                WaveTransition(
                  duration: const Duration(milliseconds: 700),
                  child: KategoriPage(id: id),
                  center: const FractionalOffset(0.5, 0),
                ),
              );
            },
          );
        },
        child: Scaffold(
          backgroundColor: Warna().primer,
          body: FutureBuilder<GetKategoriById>(
            future: JsonFuture().getKategoriById(id: id),
            builder: (context, snapshotGetKategori) {
              if (snapshotGetKategori.hasData &&
                  snapshotGetKategori.connectionState !=
                      ConnectionState.waiting &&
                  snapshotGetKategori.data != null) {
                if (snapshotGetKategori.data!.data != null) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            snapshotGetKategori.data!.data!.name!.toUpperCase(),
                            style: Font.style(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      snapshotGetKategori.data!.data!.products!.isNotEmpty
                          ? GridKategori(
                              getkategoribyid: snapshotGetKategori.data!,
                            )
                          : Center(
                              child: lottieAsset(
                                'error',
                                width: MediaQuery.of(context).size.width * 0.8,
                              ),
                            ),
                      const SizedBox(
                        height: 50,
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
            },
          ),
        ),
      ),
    );
  }
}

class GridKategori extends StatelessWidget {
  GridKategori({
    super.key,
    required this.getkategoribyid,
  });
  GetKategoriById getkategoribyid;

  @override
  Widget build(BuildContext context) {
    List<ProductsGetKategoriById> kategoriProducts =
        getkategoribyid.data!.products ?? [];
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: kategoriProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 10 / 16,
        ),
        itemBuilder: (context, index) {
          return CardGrid(
            listProducts: kategoriProducts,
            index: index,
          );
        });
  }
}
