// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';

import '../../services/styles.dart';

class TampilanReviewPage extends StatefulWidget {
  TampilanReviewPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  int id;

  @override
  State<TampilanReviewPage> createState() => _TampilanReviewPageState();
}

class _TampilanReviewPageState extends State<TampilanReviewPage> {
  bool tampilgambar = false;
  @override
  Widget build(BuildContext context) {
    double star = 0.0;
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Review",
          style: Font.style(color: Warna().putih),
        ),
        backgroundColor: Warna().first,
        centerTitle: false,
      ),
      body: FutureBuilder<GetReview>(
        future: JsonFuture().getReview(productId: widget.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState != ConnectionState.waiting &&
              snapshot.data != null &&
              snapshot.data!.data != null) {
            GetReview review = snapshot.data!;
            List<DataGetReview> datareview = snapshot.data!.data!;
            return datareview.isEmpty
                ? Center(
                    child: lottieAsset(
                      'error',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: review.totalReview!,
                          itemBuilder: (context, index) => Card(
                            color: Warna().primerCard,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Warna().icon,
                                    child: Text(
                                      datareview[index]
                                          .user!
                                          .name!
                                          .substring(0, 1)
                                          .toUpperCase(),
                                      style: Font.style(
                                        color: Warna().putih,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              datareview[index].user!.name!,
                                              style: Font.style(
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            RatingBarIndicator(
                                              rating: datareview[index]
                                                  .star!
                                                  .toDouble(),
                                              itemSize: 15,
                                              unratedColor: Colors.grey,
                                              itemBuilder: (context, index) {
                                                return const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                          datareview[index]
                                              .createdAt!
                                              .substring(0, 10),
                                          style: Font.style(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        Text(
                                          datareview[index].review!,
                                          style: Font.style(
                                              color: Warna().font,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GambarReview(
                                          image: datareview[index].image!,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Warna().terang,
              ),
            );
          }
        },
      ),
    );
  }
}

class GambarReview extends StatefulWidget {
  GambarReview({
    super.key,
    required this.image,
  });

  String image;

  @override
  State<GambarReview> createState() => _GambarReviewState();
}

class _GambarReviewState extends State<GambarReview> {
  bool tampilgambar = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tampilgambar = !tampilgambar;
        });
      },
      child: tampilgambar
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(widget.image),
            )
          : AspectRatio(
              aspectRatio: 3 / 1,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
