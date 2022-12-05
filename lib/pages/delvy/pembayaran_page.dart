import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/pages/delvy/list_alamat_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:wave_transition/wave_transition.dart';
import '../../services/local_storages.dart';
import '../../services/styles.dart';
import 'create_alamat_page.dart';

class PembayaranPage extends StatefulWidget {
  PembayaranPage({
    required this.dataKeranjang,
    Key? key,
  }) : super(key: key);

  GetKeranjang dataKeranjang;

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Pembayaran"),
        backgroundColor: Warna().first,
        foregroundColor: Warna().primer,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
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
                              color: Colors.black.withAlpha(50),
                              blurRadius: 2.0),
                        ],
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.dataKeranjang.data == null
                            ? 0
                            : widget.dataKeranjang.data!.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                  image: NetworkImage(widget.dataKeranjang
                                      .data![index].product!.image!),
                                  fit: BoxFit.cover)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget
                                    .dataKeranjang.data![index].product!.name!,
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
                                      id: widget.dataKeranjang.data![index]
                                          .product!.categoryId!
                                          .toString(),
                                    ),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.connectionState !=
                                              ConnectionState.waiting &&
                                          snapshot.data!.data != null) {
                                        return Text(
                                          snapshot.data!.data!.name!,
                                          style: Font.style(
                                            fontSize: 12,
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ),
                                  Text(
                                    "${(widget.dataKeranjang.data![index].qty ?? 0).toString()} pcs",
                                    style: Font.style(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                            ],
                          ),
                          subtitle: Text(
                            rupiah(widget
                                .dataKeranjang.data![index].product!.harga!),
                            style: Font.style(
                                color: Warna().font,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                              color: Colors.black.withAlpha(50),
                              blurRadius: 2.0),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    WaveTransition(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      child: ListAlamatPage(
                                          dataKeranjang: widget.dataKeranjang),
                                      center: const FractionalOffset(0.5, 0),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Alamat",
                                  style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 20),
                                ),
                              ),
                              GestureDetector(
                                child: Assets.lainnyaIcon("edit"),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    WaveTransition(
                                      duration:
                                          const Duration(milliseconds: 700),
                                      child: ListAlamatPage(
                                          dataKeranjang: widget.dataKeranjang),
                                      center: const FractionalOffset(0.5, 0),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                WaveTransition(
                                  duration: const Duration(milliseconds: 700),
                                  child: ListAlamatPage(
                                    dataKeranjang: widget.dataKeranjang,
                                  ),
                                  center: const FractionalOffset(0.5, 0),
                                ),
                              );
                            },
                            child: Text(
                              Storages.getAlamat(),
                              style: Font.style(
                                  // fontWeight: FontWeight.bold,
                                  color: Warna().font,
                                  fontSize: 15),
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
                            "Reguler - Sikencang",
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
                              color: Colors.black.withAlpha(50),
                              blurRadius: 2.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Subtotal",
                                    style: Font.style(
                                        // fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Rp 300.000",
                                    style: Font.style(
                                        fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Biaya Pengiriman",
                                    style: Font.style(
                                        // fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Rp 0",
                                    style: Font.style(
                                        fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: Font.style(
                                        // fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Rp 300.000",
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
              const SizedBox(
                height: 40,
              ),
            ],
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Warna().first),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Warna().first,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "BAYAR",
                      style: Font.style(
                        fontSize: 20,
                      ),
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
}
