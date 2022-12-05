// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CreateUpdateProdukPage extends StatefulWidget {
  CreateUpdateProdukPage({
    Key? key,
    this.productsKategori,
    this.productsWishlist,
  }) : super(key: key);
  ProductsGetKategoriById? productsKategori;
  ProductGetWishlist? productsWishlist;

  @override
  State<CreateUpdateProdukPage> createState() => _CreateUpdateProdukPageState();
}

class _CreateUpdateProdukPageState extends State<CreateUpdateProdukPage> {
  TextEditingController nama(String text) => TextEditingController(text: text);
  TextEditingController stok(String text) => TextEditingController(text: text);
  TextEditingController deskripsi(String text) =>
      TextEditingController(text: text);
  TextEditingController harga(String text) => TextEditingController(text: text);
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Tambah Produk"),
        backgroundColor: Warna().first,
        foregroundColor: Warna().primer,
        centerTitle: false,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Produk",
              style: Font.style(
                  fontWeight: FontWeight.bold,
                  color: Warna().font,
                  fontSize: 20),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: nama(widget.productsWishlist!.name ??
                  widget.productsKategori!.name ??
                  ''),
              decoration: InputDecoration(
                hintText: "Masukkan nama produk",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
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
              items: ["Brazil", "France", "Tunisia", "Canada"],
              // : InputDecoration(labelText: "Name"),
              onChanged: print,
              selectedItem: "Tunisia",
              validator: (String? item) {
                if (item == null)
                  return "Required field";
                else if (item == "Brazil")
                  return "Invalid item";
                else
                  return null;
              },
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: "Pilih Kategori",
            //     border:
            //         OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
            //   ),
            //   keyboardType: TextInputType.name,
            //   textInputAction: TextInputAction.done,
            // ),
            const SizedBox(height: 15),
            Text(
              "Jumlah Stok Produk",
              style: Font.style(
                  fontWeight: FontWeight.bold,
                  color: Warna().font,
                  fontSize: 20),
            ),
            TextField(
              controller: stok((widget.productsWishlist!.stock ??
                      widget.productsKategori!.stock ??
                      '')
                  .toString()),
              decoration: InputDecoration(
                hintText: "Masukkan Jumlah Stok",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
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
              controller: deskripsi(widget.productsWishlist!.deskripsi ??
                  widget.productsKategori!.deskripsi ??
                  ''),
              decoration: InputDecoration(
                hintText: "Masukkan Deskripsi Produk",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
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
              controller: harga((widget.productsWishlist!.harga ??
                      widget.productsKategori!.harga ??
                      '')
                  .toString()),
              decoration: InputDecoration(
                hintText: "Masukkan Harga Produk",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
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
                XFile? image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                file = File(image!.path);
                setState(() {});
              },
              child: file == null
                  ? Assets.lainnyaIcon('add_image')
                  : Image.file(
                      file!,
                      height: 20,
                    ),
            ),
            const Spacer(flex: 4),
            Positioned(
              left: MediaQuery.of(context).size.width / 2 + 100,
              top: MediaQuery.of(context).size.height / 3,
              child: TextButton(
                onPressed: () {},
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
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Warna().first)),
                  ),
                ),
                child: Text(
                  (widget.productsWishlist == null &&
                              widget.productsKategori == null
                          ? 'MASUKKAN KERANJANG'
                          : 'UPDATE PRODUK')
                      .toString(),
                  style: Font.style(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
