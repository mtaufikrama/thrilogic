// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/pages/delvy/list_alamat_page.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../API/object_class/keranjang.dart';

class CreateAlamat extends StatefulWidget {
  CreateAlamat({
    required this.dataKeranjang,
    Key? key,
  }) : super(key: key);
  GetKeranjang dataKeranjang;

  @override
  State<CreateAlamat> createState() => _CreateAlamatState();
}

class _CreateAlamatState extends State<CreateAlamat> {
  TextEditingController jalan = TextEditingController();
  TextEditingController kelurahan = TextEditingController();
  TextEditingController provinsi = TextEditingController();
  TextEditingController detailLainnya = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Tambah Alamat",
          style: Font.style(),
        ),
        backgroundColor: Warna().first,
        foregroundColor: Warna().primer,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
          Column(
            children: [
              Expanded(child: Container()),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () async {
                    await Storages().setListAlamat(
                      jalan: jalan.text,
                      kelurahan: kelurahan.text,
                      provinsi: provinsi.text,
                      detailLainnya: detailLainnya.text,
                    );
                    Navigator.pushReplacement(
                      context,
                      WaveTransition(
                        duration: const Duration(milliseconds: 700),
                        child:
                            ListAlamatPage(dataKeranjang: widget.dataKeranjang),
                        center: const FractionalOffset(0.5, 0),
                      ),
                    );
                  },
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
                      "SIMPAN",
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
