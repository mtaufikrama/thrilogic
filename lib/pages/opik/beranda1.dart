// ignore_for_file: must_be_immutable, iterable_contains_unrelated_type, unrelated_type_equality_checks

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/pages/delvy/tampilan_review_page.dart';
import 'package:thrilogic_shop/pages/opik/kategori_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class Beranda extends StatefulWidget {
  Beranda({
    Key? key,
    required this.getbarang,
    required this.getkategori,
  }) : super(key: key);

  GetBarang getbarang;
  GetKategori getkategori;

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    List<DataGetBarang> databarang = widget.getbarang.data ?? [];
    List<DataGetKategori> datakategori = widget.getkategori.data ?? [];
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(milliseconds: 100),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const IntegrateAPI(),
              ),
            );
            setState(() {});
          },
        );
      },
      child: Container(
        color: Warna().primer,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 3,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.decelerate,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: ['1', '2', '3'].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        child: Assets.onboarding('gambar$i'),
                      );
                    },
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      'Kategori',
                      style: Font.style(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: datakategori.map(
                          (kategori) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  WaveTransition(
                                    child: KategoriPage(
                                        id: kategori.id.toString()),
                                    center: const FractionalOffset(0.5, 0),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(databarang
                                              .isNotEmpty
                                          ? databarang.first.image!
                                          : "https://media.istockphoto.com/id/1152715842/vector/letter-tt-t-t-icon-logo-vector.jpg?b=1&s=612x612&w=0&k=20&c=OoBteZJSVPC9iaV-hVimZ_kw0J2vKqGJThu8f8LZ8NY="),
                                    ),
                                    Text(
                                      kategori.name!,
                                      style: Font.style(fontSize: 10),
                                    ),
                                  ],
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 10 / 16,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                ),
                itemCount: databarang.length,
                itemBuilder: (context, index) {
                  return CardGrid(
                    databarang: databarang,
                    index: index,
                  );
                },
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class CardGrid extends StatefulWidget {
  CardGrid({
    super.key,
    required this.databarang,
    required this.index,
  });
  List<DataGetBarang> databarang;
  int index;

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  double star = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProdukPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Warna().shadow,
              offset: const Offset(2, 4),
            ),
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
                    widget.databarang[widget.index].image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            widget.databarang[widget.index].name!,
                            style: Font.style(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(width: 5),
                        FutureBuilder<GetWishlist>(
                          future: JsonFuture().getWishlist(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot.data != null) {
                              return GestureDetector(
                                onTap: () async {
                                  if (snapshot.data!.data != null &&
                                      snapshot.data!.data!
                                          .map((e) => e.product!.id)
                                          .contains(widget
                                              .databarang[widget.index].id)) {
                                    print("delete wishlist");
                                    print(snapshot.data!.data!
                                        .map((e) => e.productId)
                                        .takeWhile((value) =>
                                            value ==
                                            widget.databarang[widget.index].id)
                                        .toList()
                                        .toString());
                                    await JsonFuture().deleteWishlist(
                                        id: snapshot.data!.data!.first.id
                                            .toString());
                                  } else {
                                    print("create wishlist");
                                    print(widget.databarang[widget.index].id!
                                        .toString());
                                    await JsonFuture().createWishlist(
                                        productId: widget
                                            .databarang[widget.index].id!
                                            .toString());
                                  }
                                  setState(() {});
                                },
                                child: snapshot.data!.data != null
                                    ? Assets.navbarIcon(
                                        snapshot.data!.data!
                                                .map(
                                                  (e) => e.product != null
                                                      ? e.product!.id
                                                      : {},
                                                )
                                                .contains(
                                                  widget
                                                      .databarang[widget.index]
                                                      .id,
                                                )
                                            ? 'hearton'
                                            : 'heart',
                                      )
                                    : Text(
                                        'err',
                                        style:
                                            Font.style(color: Warna().shadow),
                                      ),
                              );
                            } else {
                              return Center(
                                child: Container(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    FutureBuilder(
                      future: JsonFuture().getReview(
                          productId:
                              widget.databarang[widget.index].id!.toString()),
                      builder: (context, snapshotGetreview) {
                        if (snapshotGetreview.hasData &&
                            snapshotGetreview.connectionState ==
                                ConnectionState.done &&
                            snapshotGetreview.data != null) {
                          List<DataGetReview> datareview =
                              snapshotGetreview.data!.data ?? [];
                          datareview.map((e) {
                            num baps = e.star ?? 0;
                            star = star + baps;
                          }).toList();
                          star = star / datareview.length;
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TampilanReviewPage(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBarIndicator(
                                  rating: star.isNaN ? 0 : star,
                                  itemSize: 15,
                                  itemBuilder: (context, index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  },
                                ),
                                AutoSizeText(
                                  datareview.isNotEmpty
                                      ? "${datareview.length} terjual"
                                      : '',
                                  style: Font.style(),
                                  maxFontSize: 15,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Text(
                            'err',
                            style: Font.style(color: Warna().shadow),
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          rupiah(widget.databarang[widget.index].harga!),
                          style: Font.style(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                        FutureBuilder(
                          future: JsonFuture().getKeranjang(),
                          builder: (context, snapshotGetKeranjang) {
                            if (snapshotGetKeranjang.hasData &&
                                snapshotGetKeranjang.connectionState !=
                                    ConnectionState.waiting &&
                                snapshotGetKeranjang.connectionState !=
                                    ConnectionState.none &&
                                snapshotGetKeranjang.data != null) {
                              return snapshotGetKeranjang.data!.data != null
                                  ? snapshotGetKeranjang.data!.data!
                                              .map((e) => e.productId)
                                              .contains(widget
                                                  .databarang[widget.index]
                                                  .id) !=
                                          true
                                      ? GestureDetector(
                                          onTap: () async {
                                            await JsonFuture().createKeranjang(
                                                productId: widget
                                                    .databarang[widget.index].id
                                                    .toString(),
                                                qty: "1");
                                            setState(() {});
                                          },
                                          child: Assets.lainnyaIcon('tambah'),
                                        )
                                      : Icon(
                                          Icons.done_outline_rounded,
                                          color: Warna().font,
                                        )
                                  : Text(
                                      "err",
                                      style: Font.style(color: Warna().shadow),
                                    );
                            } else {
                              return Container(
                                width: 10,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
