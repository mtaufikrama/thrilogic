// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/pages/delvy/list_alamat_page.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../API/object_class/keranjang.dart';

class CreateAlamat extends StatefulWidget {
  CreateAlamat({
    this.dataKeranjang,
    this.total,
    Key? key,
  }) : super(key: key);
  GetKeranjang? dataKeranjang;
  int? total;

  @override
  State<CreateAlamat> createState() => _CreateAlamatState();
}

class _CreateAlamatState extends State<CreateAlamat> {
  TextEditingController jalan = TextEditingController();
  TextEditingController kelurahan = TextEditingController();
  TextEditingController provinsi = TextEditingController();
  TextEditingController detailLainnya = TextEditingController();
  @override
  void dispose() {
    jalan.dispose();
    kelurahan.dispose();
    provinsi.dispose();
    detailLainnya.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Tambah Alamat",
          style: Font.style(color: Warna().putih),
        ),
        backgroundColor: Warna().first,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    "Alamat",
                    style: Font.style(
                        fontWeight: FontWeight.bold,
                        color: Warna().font,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: jalan,
                    style: Font.style(),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Jalan / No. Rumah / RT. RW",
                      hintStyle: Font.style(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: kelurahan,
                    style: Font.style(),
                    decoration: InputDecoration(
                      hintText: "Kabupaten / Kota",
                      hintStyle: Font.style(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: provinsi,
                    style: Font.style(),
                    decoration: InputDecoration(
                      hintText: "Provinsi",
                      hintStyle: Font.style(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: detailLainnya,
                    style: Font.style(),
                    decoration: InputDecoration(
                      hintText: "Detail Lainnya",
                      hintStyle: Font.style(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Warna().primerCard,
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () async {
                if (jalan.text.isNotEmpty &&
                    kelurahan.text.isNotEmpty &&
                    provinsi.text.isNotEmpty) {
                  await Storages().setListAlamat(
                    jalan: jalan.text,
                    kelurahan: kelurahan.text,
                    provinsi: provinsi.text,
                    detailLainnya: detailLainnya.text,
                  );
                  snackBar(context, text: 'Alamat Berhasil Ditambahkan');
                  Navigator.pushReplacement(
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
                } else {
                  snackBar(context, text: "Mohon diisi");
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Warna().icon),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "SIMPAN",
                  style: Font.style(fontSize: 20, color: Warna().putih),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
