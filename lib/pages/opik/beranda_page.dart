// ignore_for_file: must_be_immutable, iterable_contains_unrelated_type, unrelated_type_equality_checks

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/pages/opik/kategori_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class Beranda extends StatelessWidget {
  Beranda({
    super.key,
    required this.listDataKategori,
    required this.listProducts,
  });

  List<DataGetKategoriById> listDataKategori;
  List<ProductsGetKategoriById> listProducts;
  bool nightmode = Storages.getNightMode();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(milliseconds: 100),
          () {
            Navigator.pushReplacement(
              context,
              WaveTransition(
                duration: const Duration(milliseconds: 700),
                child: const IntegrateAPI(),
                center: const FractionalOffset(0.5, 0),
              ),
            );
          },
        );
      },
      child: Container(
        color: Warna().primer,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.9,
                  aspectRatio: 3,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.decelerate,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                ),
                items: ['1', '2', '3', '4', '5'].map((i) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Warna().icon,
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Assets.onboarding('gambar$i')),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Kategori',
                      style: Font.style(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: listDataKategori.map(
                          (kategori) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  WaveTransition(
                                    duration: const Duration(milliseconds: 700),
                                    child: KategoriPage(
                                        id: kategori.id.toString()),
                                    center: const FractionalOffset(0.5, 0),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: 90,
                                  width: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Warna().primer,
                                        backgroundImage: NetworkImage(
                                          kategori.products!.isNotEmpty
                                              ? kategori.products!.first.image!
                                              : "https://media.istockphoto.com/id/1152715842/vector/letter-tt-t-t-icon-logo-vector.jpg?b=1&s=612x612&w=0&k=20&c=OoBteZJSVPC9iaV-hVimZ_kw0J2vKqGJThu8f8LZ8NY=",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        kategori.name!,
                                        textAlign: TextAlign.center,
                                        style: Font.style(fontSize: 10),
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                'List Produk',
                style: Font.style(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 10 / 15,
              ),
              itemCount: listProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      WaveTransition(
                        duration: const Duration(milliseconds: 700),
                        child: ProdukPage(id: listProducts[index].id!),
                        center: const FractionalOffset(0.5, 0),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        nightmode == false
                            ? BoxShadow(
                                blurRadius: 4,
                                color: Warna().shadow,
                                offset: const Offset(2, 4),
                              )
                            : const BoxShadow(),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Warna().primerCard,
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                listProducts[index].image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 5,
                                bottom: 10,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    listProducts[index].name!,
                                    textAlign: TextAlign.justify,
                                    style: Font.style(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  AutoSizeText(
                                    rupiah(listProducts[index].harga!),
                                    style: Font.style(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
