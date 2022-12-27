// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/alamat.dart';
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
  TextEditingController danlainlain = TextEditingController();
  TextEditingController detailLainnya = TextEditingController();
  Alamat? alamat;
  List<DataAlamat> listAlamat = [];
  String province = '';
  String city = '';
  String subdistrict = '';
  String urban = '';
  String postalcode = '';
  @override
  void dispose() {
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
          style: Font.style(color: Colors.white),
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
                    decoration: InputDecoration(
                      labelText: "Jalan, RT/RW, No. Rumah, dll",
                      labelStyle: Font.style(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 10),
                  province.isEmpty
                      ? TextField(
                          controller: danlainlain,
                          onChanged: (value) async {
                            alamat = await JsonFuture().getAlamat(value);
                            listAlamat = alamat!.data ?? [];
                            setState(() {});
                          },
                          style: Font.style(),
                          decoration: InputDecoration(
                            labelText:
                                'Cari Provinsi, Kota, Kecamatan, Kelurahan, Kode Pos',
                            labelStyle: Font.style(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        )
                      : ListTile(
                          title: Text(
                            urban,
                            style: Font.style(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          dense: true,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                city +
                                    ", " +
                                    subdistrict +
                                    "\n" +
                                    province +
                                    "\n" +
                                    postalcode,
                                style: Font.style(),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              province = '';
                              city = '';
                              postalcode = '';
                              subdistrict = '';
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.highlight_remove_rounded,
                              color: Warna().font,
                            ),
                          ),
                        ),
                  alamat != null &&
                          danlainlain.text.isNotEmpty &&
                          listAlamat.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: listAlamat.length,
                          itemBuilder: (context, index) {
                            DataAlamat datalamat = alamat!.data![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Warna().primerCard,
                                  ),
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 5),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  print(index);
                                  postalcode = datalamat.postalcode!;
                                  city = datalamat.city!;
                                  province = datalamat.province!;
                                  urban = datalamat.urban!;
                                  subdistrict = datalamat.subdistrict!;
                                  danlainlain.text = '';
                                  setState(() {});
                                },
                                child: ListTile(
                                  title: Text(
                                    datalamat.urban!,
                                    style: Font.style(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  dense: true,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        datalamat.city! +
                                            ", " +
                                            datalamat.subdistrict!,
                                        style: Font.style(),
                                      ),
                                      Text(
                                        datalamat.province!,
                                        style: Font.style(),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    datalamat.postalcode!,
                                    style: Font.style(),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Container(),
                  // TextField(
                  //   controller: jalan,
                  //   style: Font.style(),
                  //   maxLines: 5,
                  //   decoration: InputDecoration(
                  //     hintText: "Jalan / No. Rumah / RT. RW",
                  //     hintStyle: Font.style(),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(11)),
                  //   ),
                  //   keyboardType: TextInputType.name,
                  //   textInputAction: TextInputAction.done,
                  // ),
                  // const SizedBox(height: 8),
                  // TextField(
                  //   controller: kelurahan,
                  //   style: Font.style(),
                  //   decoration: InputDecoration(
                  //     hintText: "Kabupaten / Kota",
                  //     hintStyle: Font.style(),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(11)),
                  //   ),
                  //   keyboardType: TextInputType.name,
                  //   textInputAction: TextInputAction.done,
                  // ),
                  // const SizedBox(height: 8),
                  // TextField(
                  //   controller: provinsi,
                  //   style: Font.style(),
                  //   decoration: InputDecoration(
                  //     hintText: "Provinsi",
                  //     hintStyle: Font.style(),
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(11)),
                  //   ),
                  //   keyboardType: TextInputType.name,
                  //   textInputAction: TextInputAction.done,
                  // ),
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
                if (jalan.text.isNotEmpty && province.isNotEmpty) {
                  String danlainlain =
                      '$province, $city, $subdistrict, $urban, $postalcode';
                  await Storages().setListAlamat(
                    jalan: jalan.text,
                    danlainlain: danlainlain,
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
                  style: Font.style(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
