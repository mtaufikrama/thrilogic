// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/pages/delvy/create_alamat_page.dart';
import 'package:thrilogic_shop/pages/delvy/pembayaran_page.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../services/styles.dart';

class ListAlamatPage extends StatelessWidget {
  ListAlamatPage({
    Key? key,
    required this.dataKeranjang,
  }) : super(key: key);

  GetKeranjang dataKeranjang;

  List<dynamic> listalamat = Storages.getListAlamat();

  String alamat = Storages.getAlamat();

  String nama = Storages.getName();

  String notelp = Storages.getNoTelp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Alamat"),
        backgroundColor: Warna().first,
        foregroundColor: Warna().primer,
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                WaveTransition(
                  duration: const Duration(milliseconds: 700),
                  child: CreateAlamat(dataKeranjang: dataKeranjang),
                  center: const FractionalOffset(0.5, 0),
                ),
              );
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Warna().first),
            ),
            child: Text(
              "Tambahkan Alamat",
              style: Font.style(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 230, 168, 126),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: (10),
                      offset: const Offset(2.0, 5.0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Default",
                      style: Font.style(
                        fontWeight: FontWeight.bold,
                        color: Warna().font,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      nama,
                      style: Font.style(
                        // fontWeight: FontWeight.bold,
                        color: Warna().font,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "($notelp)",
                      style: Font.style(
                        // fontWeight: FontWeight.bold,
                        color: Warna().font,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      alamat,
                      style: Font.style(
                          // fontWeight: FontWeight.bold,
                          color: Warna().font,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listalamat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          await Storages().setAlamat(alamat: listalamat[index]);
                          Navigator.pushReplacement(
                            context,
                            WaveTransition(
                              duration: const Duration(milliseconds: 700),
                              child:
                                  PembayaranPage(dataKeranjang: dataKeranjang),
                              center: const FractionalOffset(0.5, 0),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(vertical: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 230, 168, 126)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: (10),
                                offset: const Offset(2.0, 5.0),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nama,
                                style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 15),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "($notelp)",
                                style: Font.style(
                                    // fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 13),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                listalamat[index],
                                style: Font.style(
                                    // fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                      "PILIH ALAMAT",
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
