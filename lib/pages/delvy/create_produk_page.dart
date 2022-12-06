// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:wave_transition/wave_transition.dart';

class CreateUpdateProdukPage extends StatefulWidget {
  CreateUpdateProdukPage({
    Key? key,
    this.id,
  }) : super(key: key);

  int? id;

  @override
  State<CreateUpdateProdukPage> createState() => _CreateUpdateProdukPageState();
}

class _CreateUpdateProdukPageState extends State<CreateUpdateProdukPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController stok = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController harga = TextEditingController();
  File? file;
  String categoryId = "34";
  List<List<String>> listkategori = [
    ["Kemeja Wanita", "34"],
    ["Blouse Wanita", "36"],
    ["Henley Top Wanita", "37"],
    ["Cropped Top Wanita", "38"],
    ["Kaos Wanita", "39"],
    ["Hoodie Wanita", "40"],
    ["Joger Pants Wanita", "41"],
    ["Kulot Wanita", "42"],
    ["Hoodie Pria", "43"],
    ["Kemeja Pria", "44"],
    ["Kaos Pria", "45"],
    ["Henley Top Pria", "46"],
    ["Jeans Pria", "47"],
    ["Joger Pants Pria", "48"],
    ["Sweater Pria", "49"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Tambah Produk",
          style: Font.style(color: Colors.white),
        ),
        backgroundColor: Warna().first,
      ),
      body: widget.id != null
          ? FutureBuilder<GetBarangById>(
              future: JsonFuture().getBarangById(id: widget.id!.toString()),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.data != null &&
                    snapshot.data!.data != null) {
                  DataGetBarangById databarang = snapshot.data!.data!;
                  nama.text = databarang.name!;
                  harga.text = databarang.harga!.toString();
                  deskripsi.text = databarang.deskripsi!;
                  stok.text = databarang.stock!.toString();
                  return Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Nama Produk",
                              style: Font.style(
                                fontWeight: FontWeight.bold,
                                color: Warna().font,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              style: Font.style(),
                              controller: nama,
                              decoration: InputDecoration(
                                hintText: "Masukkan nama produk",
                                hintStyle: Font.style(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11)),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Kategori Produk",
                              style: Font.style(
                                  fontWeight: FontWeight.bold,
                                  color: Warna().font,
                                  fontSize: 20),
                            ),
                            DropdownSearch(
                              items: listkategori,
                              onChanged: (value) {
                                categoryId = value[1];
                              },
                              itemAsString: (item) {
                                return item[0];
                              },
                              popupProps: const PopupProps.menu(),
                              selectedItem: listkategori[0],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: "Pilih Kategori",
                                  hintStyle: Font.style(),
                                ),
                              ),
                              dropdownButtonProps:
                                  DropdownButtonProps(color: Warna().font),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Jumlah Stok Produk",
                              style: Font.style(
                                  fontWeight: FontWeight.bold,
                                  color: Warna().font,
                                  fontSize: 20),
                            ),
                            TextField(
                              style: Font.style(),
                              controller: stok,
                              decoration: InputDecoration(
                                hintText: "Masukkan Jumlah Stok",
                                hintStyle: Font.style(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11)),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Deskripsi Produk",
                              style: Font.style(
                                  fontWeight: FontWeight.bold,
                                  color: Warna().font,
                                  fontSize: 20),
                            ),
                            TextField(
                              style: Font.style(),
                              maxLines: 5,
                              controller: deskripsi,
                              decoration: InputDecoration(
                                hintText: "Masukkan Deskripsi Produk",
                                hintStyle: Font.style(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11)),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "Harga Produk",
                              style: Font.style(
                                  fontWeight: FontWeight.bold,
                                  color: Warna().font,
                                  fontSize: 20),
                            ),
                            TextField(
                              style: Font.style(),
                              controller: harga,
                              decoration: InputDecoration(
                                hintText: "Masukkan Harga Produk",
                                hintStyle: Font.style(),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11)),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                            ),
                            const SizedBox(height: 15),
                            Align(
                              child: Text(
                                "Foto Produk",
                                style: Font.style(
                                    fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 20),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                XFile? image = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (image != null) {
                                  file = File(image.path);
                                  setState(() {});
                                }
                              },
                              child: file == null
                                  ? Assets.lainnyaIcon('add_image', height: 100)
                                  : Image.file(
                                      file!,
                                      height: 100,
                                    ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          if (nama.text.isNotEmpty &&
                              deskripsi.text.isNotEmpty &&
                              file != null &&
                              harga.text.isNotEmpty &&
                              stok.text.isNotEmpty) {
                            await JsonFuture().updateBarang(
                              id: widget.id!.toString(),
                              name: nama.text,
                              categoryId: categoryId,
                              image: file!,
                              stock: stok.text,
                              deskripsi: deskripsi.text,
                              harga: harga.text,
                            );
                            Navigator.pushReplacement(
                              context,
                              WaveTransition(
                                duration: const Duration(milliseconds: 700),
                                child: ProdukPage(id: widget.id!),
                                center: const FractionalOffset(0.5, 0),
                              ),
                            );
                          } else {
                            snackBar(context, text: 'Data harus diisi semua');
                          }
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(vertical: 15)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Warna().icon),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        child: Text(
                          'UPDATE PRODUK',
                          style: Font.style(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Nama Produk",
                        style: Font.style(
                          fontWeight: FontWeight.bold,
                          color: Warna().font,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        style: Font.style(),
                        controller: nama,
                        decoration: InputDecoration(
                          hintText: "Masukkan nama produk",
                          hintStyle: Font.style(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Kategori Produk",
                        style: Font.style(
                            fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 20),
                      ),
                      DropdownSearch(
                        items: listkategori,
                        onChanged: (value) {
                          categoryId = value[1];
                        },
                        popupProps: const PopupProps.menu(),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            hintText: "Pilih Kategori",
                            hintStyle: Font.style(),
                          ),
                        ),
                        dropdownButtonProps: DropdownButtonProps(
                            color: Warna().font, tooltip: 'Pilih Kategori'),
                        itemAsString: (item) {
                          return item[0];
                        },
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Jumlah Stok Produk",
                        style: Font.style(
                            fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 20),
                      ),
                      TextField(
                        style: Font.style(),
                        controller: stok,
                        decoration: InputDecoration(
                          hintText: "Masukkan Jumlah Stok",
                          hintStyle: Font.style(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Deskripsi Produk",
                        style: Font.style(
                            fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 20),
                      ),
                      TextField(
                        style: Font.style(),
                        controller: deskripsi,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Masukkan Deskripsi Produk",
                          hintStyle: Font.style(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Harga Produk",
                        style: Font.style(
                            fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 20),
                      ),
                      TextField(
                        style: Font.style(),
                        controller: harga,
                        decoration: InputDecoration(
                          hintText: "Masukkan Harga Produk",
                          hintStyle: Font.style(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11)),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Foto Produk",
                        style: Font.style(
                            fontWeight: FontWeight.bold,
                            color: Warna().font,
                            fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () async {
                          XFile? image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            file = File(image.path);
                            setState(() {});
                          }
                        },
                        child: file == null
                            ? Assets.lainnyaIcon('add_image', height: 100)
                            : Image.file(
                                file!,
                                height: 20,
                              ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (nama.text.isNotEmpty &&
                        deskripsi.text.isNotEmpty &&
                        file != null &&
                        harga.text.isNotEmpty &&
                        stok.text.isNotEmpty) {
                      await JsonFuture().createBarang(
                        name: nama.text,
                        categoryId: categoryId,
                        image: file!,
                        stock: stok.text,
                        deskripsi: deskripsi.text,
                        harga: harga.text,
                      );
                      Navigator.pushReplacement(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          child: ProdukPage(id: widget.id!),
                          center: const FractionalOffset(0.5, 0),
                        ),
                      );
                    } else {
                      snackBar(context, text: 'Data harus diisi semua');
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 113, vertical: 15)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Warna().first),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Warna().icon)),
                    ),
                  ),
                  child: Text(
                    'TAMBAH PRODUK',
                    style: Font.style(fontSize: 18),
                  ),
                ),
              ],
            ),
    );
  }
}
