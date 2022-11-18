// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/pages/delvy/tampilan_review_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/styles.dart';

class WishList extends StatefulWidget {
  const WishList({
    super.key,
  });

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  double star = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      body: FutureBuilder<GetWishlist>(
        future: JsonFuture().getWishlist(),
        builder: (context, snapshotGetWishlist) {
          if (snapshotGetWishlist.hasData &&
              snapshotGetWishlist.connectionState != ConnectionState.waiting &&
              snapshotGetWishlist.data != null) {
            if (snapshotGetWishlist.data!.data != null) {
              List<DataGetWishlist> dataWishlist =
                  snapshotGetWishlist.data!.data ?? [];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                    itemCount: dataWishlist.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10 / 16,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      ProductGetWishlist? wishlistProducts =
                          dataWishlist[index].product;
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
                                      wishlistProducts!.image!,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: AutoSizeText(
                                              wishlistProducts.name!,
                                              style: Font.style(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          GestureDetector(
                                            onTap: () async {
                                              await JsonFuture().deleteWishlist(
                                                  id: dataWishlist[index]
                                                      .id
                                                      .toString());
                                              setState(() {});
                                            },
                                            child: dataWishlist.isNotEmpty
                                                ? Assets.navbarIcon('hearton')
                                                : Text(
                                                    'err',
                                                    style: Font.style(
                                                        color: Warna().shadow),
                                                  ),
                                          ),
                                        ],
                                      ),
                                      FutureBuilder(
                                        future: JsonFuture().getReview(
                                            productId: dataWishlist[index]
                                                .productId!
                                                .toString()),
                                        builder: (context, snapshotGetreview) {
                                          if (snapshotGetreview.hasData &&
                                              snapshotGetreview
                                                      .connectionState ==
                                                  ConnectionState.done &&
                                              snapshotGetreview.data != null) {
                                            List<DataGetReview> datareview =
                                                snapshotGetreview.data!.data ??
                                                    [];
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating:
                                                        star.isNaN ? 0 : star,
                                                    itemSize: 15,
                                                    itemBuilder:
                                                        (context, index) {
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
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Text(
                                              'err',
                                              style: Font.style(
                                                  color: Warna().shadow),
                                            );
                                          }
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            rupiah(wishlistProducts.harga!),
                                            style: Font.style(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                          ),
                                          FutureBuilder(
                                            future: JsonFuture().getKeranjang(),
                                            builder: (context,
                                                snapshotGetKeranjang) {
                                              if (snapshotGetKeranjang
                                                      .hasData &&
                                                  snapshotGetKeranjang
                                                          .connectionState !=
                                                      ConnectionState.waiting &&
                                                  snapshotGetKeranjang
                                                          .connectionState !=
                                                      ConnectionState.none &&
                                                  snapshotGetKeranjang.data !=
                                                      null) {
                                                return snapshotGetKeranjang
                                                            .data!.data !=
                                                        null
                                                    ? snapshotGetKeranjang
                                                                .data!.data!
                                                                .map((e) =>
                                                                    e.productId)
                                                                .contains(
                                                                    dataWishlist[
                                                                            index]
                                                                        .id) !=
                                                            true
                                                        ? GestureDetector(
                                                            onTap: () async {
                                                              await JsonFuture()
                                                                  .createKeranjang(
                                                                      productId:
                                                                          dataWishlist[index]
                                                                              .id
                                                                              .toString(),
                                                                      qty: "1");
                                                              setState(() {});
                                                            },
                                                            child: Assets
                                                                .lainnyaIcon(
                                                                    'tambah'),
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .done_outline_rounded,
                                                            color: Warna().font,
                                                          )
                                                    : Text(
                                                        "err",
                                                        style: Font.style(
                                                            color:
                                                                Warna().shadow),
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
                    }),
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
