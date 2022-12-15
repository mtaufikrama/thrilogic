import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/pages/delvy/keranjang_page.dart';
import 'package:thrilogic_shop/pages/delvy/list_alamat_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class PembayaranPage extends StatefulWidget {
  PembayaranPage({
    required this.dataKeranjang,
    required this.total,
    Key? key,
  }) : super(key: key);

  GetKeranjang dataKeranjang;
  int total;

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
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
      body: Stack(
        children: [
          Column(
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
                          leading: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: NetworkImage(widget.dataKeranjang
                                    .data![index].product!.image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
                              fontWeight: FontWeight.bold,
                            ),
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
                            blurRadius: 2.0,
                          ),
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
                                          dataKeranjang: widget.dataKeranjang,
                                          total: widget.total),
                                      center: const FractionalOffset(0.5, 0),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Alamat",
                                  style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 20,
                                  ),
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
                                          dataKeranjang: widget.dataKeranjang,
                                          total: widget.total),
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
                                    total: widget.total,
                                  ),
                                  center: const FractionalOffset(0.5, 0),
                                ),
                              );
                            },
                            child: Text(
                              Storages.getAlamat().isNotEmpty
                                  ? Storages.getAlamat()
                                  : "Pilih Alamat",
                              style: Font.style(
                                // fontWeight: FontWeight.bold,
                                color: Storages.getAlamat().isNotEmpty
                                    ? Warna().font
                                    : Warna().terang,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Pengiriman",
                            style: Font.style(
                              fontWeight: FontWeight.bold,
                              color: Warna().font,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Reguler - MeTiR Fast",
                            style: Font.style(
                              // fontWeight: FontWeight.bold,
                              color: Warna().font,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Pembayaran",
                            style: Font.style(
                              fontWeight: FontWeight.bold,
                              color: Warna().font,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Bank Negara Indonesia - BNI",
                            style: Font.style(
                              // fontWeight: FontWeight.bold,
                              color: Warna().font,
                              fontSize: 15,
                            ),
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
                            blurRadius: 2.0,
                          ),
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
                                  fontSize: 20,
                                ),
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
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    rupiah(widget.total),
                                    style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 15,
                                    ),
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
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Rp9.000",
                                    style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Potongan Ongkir",
                                    style: Font.style(
                                      // fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "-Rp9.000",
                                    style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 15,
                                    ),
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
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    rupiah(widget.total),
                                    style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 15,
                                    ),
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
                  onPressed: () async {
                    if (Storages.getAlamat().isNotEmpty) {
                      CreateTransaksi transaksi = await JsonFuture()
                          .createTransaksi(alamat: Storages.getAlamat());
                      snackBar(context, text: transaksi.info ?? 'GAGAL');
                      if (transaksi.info != null && transaksi.code == '00') {
                        await Notifikasi.notif(
                          title: 'Transaksi',
                          body:
                              "${transaksi.data!.products!.first.name!} ${transaksi.data!.products!.length == 1 ? '' : 'dan lainnya'} Berhasil Diperoleh",
                        );
                        cart.cart = 0;
                        // await Storages().setLengthCart(jumlah: 0);
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: Keranjang(),
                            center: const FractionalOffset(0.5, 0),
                          ),
                        );
                      }
                    } else {
                      snackBar(context, text: "Pilih Alamat");
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Warna().icon),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "BAYAR",
                      style: Font.style(fontSize: 20, color: Warna().putih),
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
