// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/pages/delvy/tampilan_review_page.dart';
import 'package:thrilogic_shop/services/styles.dart';

class ReviewStar extends StatelessWidget {
  ReviewStar({
    super.key,
    required this.index,
    required this.listProducts,
  });

  int index;
  List<ProductsGetKategoriById> listProducts;

  @override
  Widget build(BuildContext context) {
    double star = 0.0;
    return FutureBuilder<GetReview>(
      future:
          JsonFuture().getReview(productId: listProducts[index].id!.toString()),
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