// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/pages/delvy/tampilan_review_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';

class KategoriPage extends StatelessWidget {
  KategoriPage({
    super.key,
    required this.id,
  });

  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      body: FutureBuilder<GetKategoriById>(
        future: JsonFuture().getKategoriById(id: id),
        builder: (context, snapshotGetKategori) {
          if (snapshotGetKategori.hasData &&
              snapshotGetKategori.connectionState != ConnectionState.waiting &&
              snapshotGetKategori.data != null) {
            if (snapshotGetKategori.data!.data != null) {
              return ListView(
                children: [
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: Text(
                        snapshotGetKategori.data!.data!.name!.toUpperCase(),
                        style: Font.style(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  snapshotGetKategori.data!.data!.products!.isNotEmpty
                      ? GridKategori(
                          getkategoribyid: snapshotGetKategori.data!,
                        )
                      : Center(
                          child: Text(
                            'NO DATA',
                            style: Font.style(),
                          ),
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              );
            } else {
              return Center(
                child: Text(
                  "NO DATA",
                  style: Font.style(),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
          return CardKategoriById(
            kategoriProducts: kategoriProducts,
            index: index,
          );
        });
  }
}

class CardKategoriById extends StatefulWidget {
  CardKategoriById({
    super.key,
    required this.kategoriProducts,
    required this.index,
  });
  List<ProductsGetKategoriById> kategoriProducts;
  int index;

  @override
  State<CardKategoriById> createState() => _CardKategoriByIdState();
}

class _CardKategoriByIdState extends State<CardKategoriById> {
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
                    widget.kategoriProducts[widget.index].image!,
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
                            child: Text(
                              widget.kategoriProducts[widget.index].name!,
                              style: Font.style(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(width: 5),
                          WishlistAddKategori(
                            kategoriProducts: widget.kategoriProducts,
                            index: widget.index,
                          ),
                        ],
                      ),
                      ReviewAddKategori(
                        kategoriProducts: widget.kategoriProducts,
                        index: widget.index,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            rupiah(
                                widget.kategoriProducts[widget.index].harga!),
                            style: Font.style(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                          ),
                          KeranjangAddKategori(
                            kategoriProducts: widget.kategoriProducts,
                            index: widget.index,
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

class WishlistAddKategori extends StatefulWidget {
  WishlistAddKategori({
    super.key,
    required this.kategoriProducts,
    required this.index,
  });
  List<ProductsGetKategoriById> kategoriProducts;
  int index;

  @override
  State<WishlistAddKategori> createState() => _WishlistAddKategoriState();
}

class _WishlistAddKategoriState extends State<WishlistAddKategori> {
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
                        widget.kategoriProducts[widget.index].id,
                      ) !=
                  true) {
                var wishlist = await JsonFuture().createWishlist(
                    productId:
                        widget.kategoriProducts[widget.index].id!.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wishlist.info ?? 'ERROR'),
                  ),
                );
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
                              widget.kategoriProducts[widget.index].id,
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

class ReviewAddKategori extends StatefulWidget {
  ReviewAddKategori({
    super.key,
    required this.kategoriProducts,
    required this.index,
  });
  List<ProductsGetKategoriById> kategoriProducts;
  int index;

  @override
  State<ReviewAddKategori> createState() => _ReviewAddKategoriState();
}

class _ReviewAddKategoriState extends State<ReviewAddKategori> {
  double star = 0.0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JsonFuture().getReview(
          productId: widget.kategoriProducts[widget.index].id!.toString()),
      builder: (context, snapshotGetreview) {
        if (snapshotGetreview.hasData &&
            snapshotGetreview.connectionState == ConnectionState.done &&
            snapshotGetreview.data != null) {
          List<DataGetReview> datareview = snapshotGetreview.data!.data ?? [];
          star = datareview
              .map((e) => e.star!.toDouble())
              .fold(0.0, (previousValue, element) => previousValue + element);
          star = star / datareview.length.toDouble();
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
                AutoSizeText(
                  datareview.isNotEmpty ? "${datareview.length} terjual" : '',
                  style: Font.style(),
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

class KeranjangAddKategori extends StatefulWidget {
  KeranjangAddKategori({
    super.key,
    required this.kategoriProducts,
    required this.index,
  });
  List<ProductsGetKategoriById> kategoriProducts;
  int index;

  @override
  State<KeranjangAddKategori> createState() => _KeranjangAddKategoriState();
}

class _KeranjangAddKategoriState extends State<KeranjangAddKategori> {
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
                          .contains(widget.kategoriProducts[widget.index].id) !=
                      true
                  ? GestureDetector(
                      onTap: () async {
                        var keranjang = await JsonFuture().createKeranjang(
                            productId: widget.kategoriProducts[widget.index].id
                                .toString(),
                            qty: "1");
                        await Storages().setAddCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(keranjang.info!),
                          ),
                        );
                        setState(() {});
                      },
                      child: Assets.lainnyaIcon('tambah'),
                    )
                  : GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.done_outline_rounded,
                        color: Warna().font,
                      ),
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
