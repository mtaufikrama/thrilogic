// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/pages/delvy/tampilan_review_page.dart';
import 'package:thrilogic_shop/pages/opik/splash_login.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class ReviewStar extends StatelessWidget {
  ReviewStar({
    super.key,
    required this.id,
  });

  final int id;
  final String nama = Storages.getName();

  @override
  Widget build(BuildContext context) {
    double star = 0.0;
    return FutureBuilder<GetReview>(
      future: JsonFuture().getReview(productId: id.toString()),
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
              if (nama.isNotEmpty) {
                Navigator.push(
                  context,
                  WaveTransition(
                    duration: const Duration(milliseconds: 700),
                    child: TampilanReviewPage(id: id),
                    center: const FractionalOffset(0.5, 0),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  WaveTransition(
                    duration: const Duration(milliseconds: 700),
                    child: SplashLogin(
                      navigate: true,
                    ),
                    center: const FractionalOffset(0.5, 0),
                  ),
                );
              }
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
