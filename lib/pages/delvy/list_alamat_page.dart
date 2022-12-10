// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/pages/delvy/create_alamat_page.dart';
import 'package:thrilogic_shop/pages/delvy/pembayaran_page.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../services/styles.dart';

class ListAlamatPage extends StatefulWidget {
  ListAlamatPage({
    Key? key,
    this.dataKeranjang,
    this.total,
  }) : super(key: key);

  GetKeranjang? dataKeranjang;
  int? total;

  @override
  State<ListAlamatPage> createState() => _ListAlamatPageState();
}

class _ListAlamatPageState extends State<ListAlamatPage> {
  List<dynamic> listalamat = Storages.getListAlamat();

  String alamat = Storages.getAlamat();

  String nama = Storages.getName();

  String notelp = Storages.getNoTelp();

  @override
  Widget build(BuildContext context) {
    print(Warna().primer);
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Alamat"),
        backgroundColor: Warna().first,
        centerTitle: false,
        actions: [
          listalamat.isNotEmpty
              ? IconButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      WaveTransition(
                        duration: const Duration(milliseconds: 700),
                        child: CreateAlamat(
                          dataKeranjang: widget.dataKeranjang,
                          total: widget.total,
                        ),
                        center: const FractionalOffset(0.5, 0),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  tooltip: 'Tambah Alamat',
                )
              : Container(),
        ],
      ),
      body: listalamat.isNotEmpty
          ? ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                alamat.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Warna().terang,
                          boxShadow: [
                            BoxShadow(
                              color: Warna().shadow,
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
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              nama,
                              style: Font.style(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "($notelp)",
                              style: Font.style(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              alamat,
                              style:
                                  Font.style(color: Colors.white, fontSize: 13),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(
                        height: 15,
                      ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listalamat.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        await Storages().setAlamat(alamat: listalamat[index]);
                        if (widget.dataKeranjang != null) {
                          Navigator.pushReplacement(
                            context,
                            WaveTransition(
                              duration: const Duration(milliseconds: 700),
                              child: PembayaranPage(
                                dataKeranjang: widget.dataKeranjang!,
                                total: widget.total!,
                              ),
                              center: const FractionalOffset(0.5, 0),
                            ),
                          );
                        } else {
                          setState(() {});
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Warna().primerCard,
                          boxShadow: [
                            BoxShadow(
                              color: Warna().shadow,
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
                            const SizedBox(height: 5),
                            Text(
                              "($notelp)",
                              style: Font.style(
                                  // fontWeight: FontWeight.bold,
                                  color: Warna().font,
                                  fontSize: 13),
                            ),
                            const SizedBox(height: 5),
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
              ],
            )
          : Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      WaveTransition(
                        duration: const Duration(milliseconds: 700),
                        child: CreateAlamat(
                          dataKeranjang: widget.dataKeranjang,
                          total: widget.total,
                        ),
                        center: const FractionalOffset(0.5, 0),
                      ),
                    );
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
                      "TAMBAH ALAMAT",
                      style: Font.style(
                        fontSize: 20,
                        color: Warna().primer,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
