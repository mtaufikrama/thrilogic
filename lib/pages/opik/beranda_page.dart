// ignore_for_file: must_be_immutable, iterable_contains_unrelated_type, unrelated_type_equality_checks

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
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
    required this.listDataKategori,
    required this.listProducts,
  }) : super(key: key);

  List<DataGetKategoriById> listDataKategori;
  List<ProductsGetKategoriById> listProducts;

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(milliseconds: 100),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const IntegrateAPI(),
              ),
            );
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
                            color: Warna().icon,
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
                        children: widget.listDataKategori.map(
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
                                child: Column(
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 10 / 16,
              ),
              itemCount: widget.listProducts.length,
              itemBuilder: (context, index) {
                return CardGrid(
                  listProducts: widget.listProducts,
                  index: index,
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

class CardGrid extends StatefulWidget {
  CardGrid({
    super.key,
    required this.listProducts,
    required this.index,
  });
  List<ProductsGetKategoriById> listProducts;
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
          WaveTransition(
            duration: const Duration(milliseconds: 700),
            child: const ProdukPage(),
            center: const FractionalOffset(0.5, 0),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 10,
        ),
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
                    widget.listProducts[widget.index].image!,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              widget.listProducts[widget.index].name!,
                              style: Font.style(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(width: 5),
                          WishlistAdd(
                            index: widget.index,
                            listProducts: widget.listProducts,
                          ),
                        ],
                      ),
                      ReviewStar(
                        index: widget.index,
                        listProducts: widget.listProducts,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            rupiah(widget.listProducts[widget.index].harga!),
                            style: Font.style(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          KeranjangAdd(
                            index: widget.index,
                            listProducts: widget.listProducts,
                          ),
                        ],
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
  }
}

class WishlistAdd extends StatefulWidget {
  WishlistAdd({
    super.key,
    required this.index,
    required this.listProducts,
  });
  int index;
  List<ProductsGetKategoriById> listProducts;

  @override
  State<WishlistAdd> createState() => _WishlistAddState();
}

class _WishlistAddState extends State<WishlistAdd> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetWishlist>(
      future: JsonFuture().getWishlist(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState != ConnectionState.waiting &&
            snapshot.data != null) {
          return GestureDetector(
            onTap: () async {
              if (snapshot.data!.data!
                      .map(
                        (e) => e.product != null ? e.product!.id : {},
                      )
                      .contains(
                        widget.listProducts[widget.index].id,
                      ) !=
                  true) {
                await JsonFuture().createWishlist(
                    productId:
                        widget.listProducts[widget.index].id!.toString());
                setState(() {});
              }
            },
            child: snapshot.data!.data != null
                ? Assets.navbarIcon(
                    snapshot.data!.data!
                            .map(
                              (e) => e.product != null ? e.product!.id : {},
                            )
                            .contains(
                              widget.listProducts[widget.index].id,
                            )
                        ? 'hearton'
                        : 'heart',
                  )
                : Text(
                    'err',
                    style: Font.style(color: Warna().shadow),
                  ),
          );
        } else {
          return Center(
            child: Container(),
          );
        }
      },
    );
  }
}

class ReviewStar extends StatefulWidget {
  ReviewStar({
    super.key,
    required this.index,
    required this.listProducts,
  });
  int index;
  List<ProductsGetKategoriById> listProducts;

  @override
  State<ReviewStar> createState() => _ReviewStarState();
}

class _ReviewStarState extends State<ReviewStar> {
  @override
  Widget build(BuildContext context) {
    double star = 0.0;
    return FutureBuilder<GetReview>(
      future: JsonFuture().getReview(
          productId: widget.listProducts[widget.index].id!.toString()),
      builder: (context, snapshotGetreview) {
        if (snapshotGetreview.hasData &&
            snapshotGetreview.connectionState == ConnectionState.done &&
            snapshotGetreview.data != null) {
          List<DataGetReview> datareview = snapshotGetreview.data!.data ?? [];
          star = datareview
              .map((e) => e.star!.toDouble())
              .fold(0.0, (previousValue, element) => previousValue + element);
          star = star / datareview.length;
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TampilanReviewPage(),
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
                  datareview.isNotEmpty ? "${datareview.length} terjual" : '',
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
    );
  }
}

class KeranjangAdd extends StatefulWidget {
  KeranjangAdd({
    super.key,
    required this.index,
    required this.listProducts,
  });
  int index;
  List<ProductsGetKategoriById> listProducts;

  @override
  State<KeranjangAdd> createState() => _KeranjangAddState();
}

class _KeranjangAddState extends State<KeranjangAdd> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetKeranjang>(
      future: JsonFuture().getKeranjang(),
      builder: (context, snapshotGetKeranjang) {
        if (snapshotGetKeranjang.hasData &&
            snapshotGetKeranjang.connectionState != ConnectionState.waiting &&
            snapshotGetKeranjang.connectionState != ConnectionState.none &&
            snapshotGetKeranjang.data != null) {
          return snapshotGetKeranjang.data!.data != null
              ? snapshotGetKeranjang.data!.data!
                          .map((e) => e.productId)
                          .contains(widget.listProducts[widget.index].id) !=
                      true
                  ? GestureDetector(
                      onTap: () async {
                        await JsonFuture().createKeranjang(
                            productId:
                                widget.listProducts[widget.index].id.toString(),
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
    );
  }
}
