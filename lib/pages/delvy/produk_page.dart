// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/pages/delvy/tampilan_review_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';

class ProdukPage extends StatefulWidget {
  ProdukPage({
    this.productsKategori,
    this.productsWishlist,
    Key? key,
  }) : super(key: key);

  ProductsGetKategoriById? productsKategori;
  ProductGetWishlist? productsWishlist;

  @override
  State<ProdukPage> createState() => _ProdukPage();
}

class _ProdukPage extends State<ProdukPage> {
  String nama = Storages.getName();
  // int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const BackButton(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Column(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20),
              //     bottomRight: Radius.circular(20),
              //   ),
              //   child: Image(
              //     image: NetworkImage(
              //       widget.productsKategori != null
              //           ? widget.productsKategori!.image!
              //           : widget.productsWishlist != null
              //               ? widget.productsWishlist!.image!
              //               : "https://media.istockphoto.com/id/1152715842/vector/letter-tt-t-t-icon-logo-vector.jpg?b=1&s=612x612&w=0&k=20&c=OoBteZJSVPC9iaV-hVimZ_kw0J2vKqGJThu8f8LZ8NY=",
              //     ),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.productsKategori != null
                                      ? widget.productsKategori!.name!
                                      : widget.productsWishlist != null
                                          ? widget.productsWishlist!.name!
                                          : "err",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                rupiah(widget.productsKategori != null
                                    ? widget.productsKategori!.harga!
                                    : widget.productsWishlist != null
                                        ? widget.productsWishlist!.harga!
                                        : 0),
                                style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReviewStarP(
                                productsKategori: widget.productsKategori,
                                productsWishlist: widget.productsWishlist,
                              ),
                              WishlistAddProduk(
                                productsKategori: widget.productsKategori,
                                productsWishlist: widget.productsWishlist,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Deskripsi",
                            style: Font.style(
                                fontWeight: FontWeight.bold,
                                color: Warna().font,
                                fontSize: 18),
                          ),
                          Text(
                            widget.productsKategori != null
                                ? widget.productsKategori!.deskripsi!
                                : widget.productsWishlist != null
                                    ? widget.productsWishlist!.deskripsi!
                                    : "err",
                            textAlign: TextAlign.justify,
                            maxLines: 7,
                            style: Font.style(color: Warna().font, fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () => showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => buildSheet()),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                            child: Text("Baca selengkapnya...",
                                style: Font.style(
                                    fontSize: 12, color: Warna().font)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(child: Container()),
              nama == 'admin'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 55, vertical: 15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Warna().first),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Warna().first)),
                                ),
                              ),
                              child: Text("Perbarui",
                                  style: Font.style(fontSize: 18)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Warna().first),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Warna().first)),
                                ),
                              ),
                              child: Text("Hapus",
                                  style: Font.style(fontSize: 18)),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton(
                        onPressed: () async {
                          CreateKeranjang keranjang =
                              await JsonFuture().createKeranjang(
                            productId: (widget.productsKategori != null
                                    ? widget.productsKategori!.id!
                                    : widget.productsWishlist != null
                                        ? widget.productsWishlist!.id!
                                        : 0)
                                .toString(),
                            qty: "1",
                          );
                          snackBar(
                            context,
                            text: keranjang.info ?? 'TERJADI KESALAHAN',
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Warna().first),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Warna().first,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          "Tambahkan Keranjang",
                          style: Font.style(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSheet() => makeDismisibble(
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.6,
          builder: (_, contoller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            padding: const EdgeInsets.all(18),
            child: ListView(
              controller: contoller,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.productsKategori != null
                            ? widget.productsKategori!.name!
                            : widget.productsWishlist != null
                                ? widget.productsWishlist!.name!
                                : "err",
                        style: Font.style(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Deskripsi",
                      style:
                          Font.style(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      widget.productsKategori != null
                          ? widget.productsKategori!.deskripsi!
                          : widget.productsWishlist != null
                              ? widget.productsWishlist!.deskripsi!
                              : "err",
                      style: Font.style(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget makeDismisibble({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );
}

class ReviewStarP extends StatefulWidget {
  ReviewStarP({
    super.key,
    this.productsKategori,
    this.productsWishlist,
  });
  ProductsGetKategoriById? productsKategori;
  ProductGetWishlist? productsWishlist;

  @override
  State<ReviewStarP> createState() => _ReviewStarPState();
}

class _ReviewStarPState extends State<ReviewStarP> {
  @override
  Widget build(BuildContext context) {
    double star = 0.0;
    return FutureBuilder<GetReview>(
      future: JsonFuture().getReview(
        productId:
            (widget.productsKategori!.id ?? widget.productsWishlist!.id ?? 0)
                .toString(),
      ),
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
                  unratedColor: Colors.grey,
                  itemBuilder: (context, index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                ),
                const SizedBox(width: 10),
                AutoSizeText(
                  star.isNaN ? "( 0 )" : "( $star )",
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

class WishlistAddProduk extends StatefulWidget {
  WishlistAddProduk({
    super.key,
    this.productsKategori,
    this.productsWishlist,
  });
  ProductsGetKategoriById? productsKategori;
  ProductGetWishlist? productsWishlist;

  @override
  State<WishlistAddProduk> createState() => _WishlistAddProdukState();
}

class _WishlistAddProdukState extends State<WishlistAddProduk> {
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
                        widget.productsKategori!.id ??
                            widget.productsWishlist!.id ??
                            0,
                      ) !=
                  true) {
                await JsonFuture().createWishlist(
                    productId: (widget.productsKategori!.id ??
                            widget.productsWishlist!.id ??
                            0)
                        .toString());
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
                              widget.productsKategori!.id ??
                                  widget.productsWishlist!.id ??
                                  0,
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
