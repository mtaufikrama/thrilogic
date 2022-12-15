import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/pages/yozi/selesai_pembayaran.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class CreateReviewPage extends StatefulWidget {
  CreateReviewPage({
    Key? key,
    required this.datatransaksi,
    required this.id,
    required this.image,
  }) : super(key: key);
  DataGetTransaksi datatransaksi;
  int id;
  String image;

  @override
  State<CreateReviewPage> createState() => _CreateReviewPageState();
}

class _CreateReviewPageState extends State<CreateReviewPage> {
  TextEditingController pesan = TextEditingController();
  String? file;
  double rating = 5;
  @override
  void dispose() {
    pesan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double star = 0.0;
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Review Produk",
          style: Font.style(
            color: Colors.white,
          ),
        ),
        backgroundColor: Warna().first,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPadding),
                  RatingBar.builder(
                    itemSize: 50,
                    initialRating: rating,
                    minRating: 1,
                    itemCount: 5,
                    glow: false,
                    unratedColor: Colors.grey,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rate) {
                      rating = rate;
                    },
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Pesan",
                        style: Font.style(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: pesan,
                      style: Font.style(),
                      minLines: 2,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Tuliskan pesan kamu',
                          hintStyle: Font.style(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () async {
                        XFile? image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          file = image.path;
                          setState(() {});
                        }
                      },
                      child: file == null
                          ? Assets.lainnyaIcon('add_image', height: 100)
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(file!),
                                  height: 100,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () async {
                  if (pesan.text.isNotEmpty && file != null) {
                    rating.toInt();
                    CreateReview createReview = await JsonFuture().createReview(
                      id: widget.id.toString(),
                      star: rating.toInt().toString(),
                      review: pesan.text,
                      image: file!,
                    );
                    snackBar(context,
                        text: createReview.info ??
                            createReview.message ??
                            'TERJADI KESALAHAN');
                    if (createReview.code == '00') {
                      await Notifikasi.notif(
                          title: 'Review produk',
                          body:
                              "Terimakasih sudah Memberikan ${createReview.data!.star!} Star dengan review ${createReview.data!.review!}");
                      Navigator.pushReplacement(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          child: SelesaiPembayaranPage(
                              datatransaksi: widget.datatransaksi),
                          center: const FractionalOffset(0.5, 0.5),
                        ),
                      );
                    }
                  } else {
                    snackBar(context, text: 'Data harus diisi');
                  }
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 15),
                  ),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Warna().icon),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                child: Text(
                  'SIMPAN',
                  style: Font.style(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
