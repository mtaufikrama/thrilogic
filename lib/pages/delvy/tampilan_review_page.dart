import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../services/styles.dart';

class TampilanReviewPage extends StatefulWidget {
  const TampilanReviewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TampilanReviewPage> createState() => _TampilanReviewPageState();
}

class _TampilanReviewPageState extends State<TampilanReviewPage> {
  @override
  Widget build(BuildContext context) {
    double star = 0.0;
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: Text("Review"),
        backgroundColor: Warna().first,
        foregroundColor: Warna().primer,
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) => Card(
                // color: Color.fromARGB(0, 255, 15, 15),
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                          image: AssetImage("assets/img/profil.jpg"),
                          fit: BoxFit.cover)),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delvy",
                            style: Font.style(fontWeight: FontWeight.bold),
                          ),
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
                        ],
                      ),
                      Text("Just now", style: Font.style(fontSize: 12)),
                      SizedBox(height: 7),
                    ],
                  ),
                  subtitle: Text(
                    "Harganya terjangkau dapat barangnya berkualitas juga lagi, next time beli lagi deh ",
                    style: Font.style(
                        color: Warna().font, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
