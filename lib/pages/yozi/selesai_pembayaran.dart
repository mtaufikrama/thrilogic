import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/pages/yozi/create_review.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class SelesaiPembayaranPage extends StatefulWidget {
  SelesaiPembayaranPage({
    Key? key,
    required this.datatransaksi,
  }) : super(key: key);

  DataGetTransaksi datatransaksi;

  @override
  State<SelesaiPembayaranPage> createState() => _SelesaiPembayaranPageState();
}

class _SelesaiPembayaranPageState extends State<SelesaiPembayaranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Pembayaran",
          style: Font.style(color: Warna().putih),
        ),
        backgroundColor: Warna().first,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  padding: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  // height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Warna().primerCard,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(50), blurRadius: 2.0),
                    ],
                  ),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.datatransaksi.products!.length,
                      itemBuilder: (context, index) {
                        ProductsGetTransaksi productsGetTransaksi =
                            widget.datatransaksi.products![index];
                        return ListTile(
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image:
                                    NetworkImage(productsGetTransaksi.image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productsGetTransaksi.name!,
                                style: Font.style(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FutureBuilder<GetKategoriById>(
                                    future: JsonFuture().getKategoriById(
                                      id: productsGetTransaksi.categoryId!
                                          .toString(),
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.connectionState !=
                                              ConnectionState.waiting &&
                                          snapshot.data!.data != null) {
                                        return Text(
                                          snapshot.data!.data!.name!,
                                          style: Font.style(fontSize: 12),
                                        );
                                      } else {
                                        return Center(
                                          child: Text(
                                            "waiting..",
                                            style: Font.style(fontSize: 12),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  Text(
                                    "${(productsGetTransaksi.pivot!.qty ?? 0).toString()} pcs",
                                    style: Font.style(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  rupiah(productsGetTransaksi.harga!),
                                  style: Font.style(
                                    color: Warna().font,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    WaveTransition(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      center: const FractionalOffset(0.9, 0.0),
                                      child: CreateReviewPage(
                                        image: productsGetTransaksi.image!,
                                        datatransaksi: widget.datatransaksi,
                                        id: productsGetTransaksi.id!,
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Warna().icon),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "REVIEW",
                                    style: Font.style(
                                        color: Warna().putih, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  padding: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Warna().primerCard,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(50), blurRadius: 2.0),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alamat",
                        style: Font.style(
                          fontWeight: FontWeight.bold,
                          color: Warna().font,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.datatransaksi.alamat!,
                        style: Font.style(
                          // fontWeight: FontWeight.bold,
                          color: Warna().font,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Pengiriman",
                        style: Font.style(
                            fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 20),
                      ),
                      Text(
                        "Reguler - MeTiR Fast",
                        style: Font.style(
                            // fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Pembayaran",
                        style: Font.style(
                            fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 20),
                      ),
                      Text(
                        "Bank Negara Indonesia - BNI",
                        style: Font.style(
                            // fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  padding: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Warna().primerCard,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(50), blurRadius: 2.0),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Info Order",
                            style: Font.style(
                                fontWeight: FontWeight.bold,
                                color: Warna().font,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: Font.style(
                                    // fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                              Text(
                                rupiah(widget.datatransaksi.total!),
                                style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Biaya Pengiriman",
                                style: Font.style(
                                    // fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                              Text(
                                "Rp9.000",
                                style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Potongan Ongkir",
                                style: Font.style(
                                    // fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                              Text(
                                "-Rp9.000",
                                style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: Font.style(
                                    // fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                              Text(
                                rupiah(widget.datatransaksi.total!),
                                style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
