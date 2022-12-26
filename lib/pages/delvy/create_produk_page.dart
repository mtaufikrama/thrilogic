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
    this.category_id,
    this.deskripsi,
    this.harga,
    this.name,
    this.stock,
    this.image,
  }) : super(key: key);

  int? id;
  String? name;
  String? category_id;
  String? stock;
  String? deskripsi;
  String? harga;
  String? image;

  @override
  State<CreateUpdateProdukPage> createState() => _CreateUpdateProdukPageState();
}

class _CreateUpdateProdukPageState extends State<CreateUpdateProdukPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController stok = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController harga = TextEditingController();
  String? file;
  String categoryId = "34";
  GetBarang? cekmessage;

  @override
  void initState() {
    nama.text = widget.name ?? '';
    harga.text = widget.harga ?? '';
    deskripsi.text = widget.deskripsi ?? '';
    stok.text = widget.stock ?? '';
    super.initState();
  }

  @override
  void dispose() {
    nama.dispose();
    stok.dispose();
    deskripsi.dispose();
    harga.dispose();
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
          "Tambah Produk",
          style: Font.style(color: Colors.white),
        ),
        backgroundColor: Warna().first,
      ),
      body: Column(
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
                    hintStyle: Font.style(color: Colors.grey),
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
                    categoryId = value['id'];
                    print(categoryId);
                  },
                  itemAsString: (item) {
                    return item['name'];
                  },
                  popupProps: PopupProps.menu(
                    listViewProps: ListViewProps(),
                    itemBuilder: (context, dynamic item, isSelected) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 0.5),
                        padding: EdgeInsets.all(20),
                        color: Warna().primerCard,
                        child: Text(
                          item['name'],
                          style: Font.style(),
                        ),
                      );
                    },
                  ),
                  selectedItem: listkategori[0],
                  dropdownBuilder: (context, selectedItem) {
                    return Text(
                      selectedItem['name'],
                      style: Font.style(),
                    );
                  },
                  dropdownButtonProps: DropdownButtonProps(color: Warna().font),
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
                    hintStyle: Font.style(color: Colors.grey),
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
                    hintStyle: Font.style(color: Colors.grey),
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
                    hintStyle: Font.style(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () async {
                      XFile? image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        file = image.path;
                        setState(() {});
                      }
                    },
                    child: SizedBox(
                      height: 100,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: file == null
                            ? widget.image != null
                                ? Stack(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            widget.image!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.refresh_rounded,
                                          color: Warna().terang,
                                          size: 30,
                                        ),
                                      )
                                    ],
                                  )
                                : Assets.lainnyaIcon(
                                    'add_image',
                                  )
                            : Stack(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(file!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.refresh_rounded,
                                      color: Warna().terang,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Container(
            color: Warna().primerCard,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(15),
            child: TextButton(
              onPressed: () async {
                if (widget.category_id != null &&
                    widget.deskripsi != null &&
                    widget.harga != null &&
                    widget.name != null &&
                    widget.stock != null) {
                  if (file != null) {
                    UpdateBarang updateBarang = await JsonFuture().updateBarang(
                      id: widget.id.toString(),
                      name: nama.text,
                      categoryId: categoryId,
                      image: file!,
                      stock: stok.text,
                      deskripsi: deskripsi.text,
                      harga: harga.text,
                    );
                    snackBar(context,
                        text: updateBarang.info ?? 'TERJADI KESALAHAN');
                    if (updateBarang.code == '00' &&
                        updateBarang.data != null &&
                        updateBarang.data!.id != null) {
                      await Notifikasi.notif(
                          title: 'Update Produk',
                          body:
                              "${updateBarang.data!.name!} Berhasil Diperbaharui");
                      Navigator.pushReplacement(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          child: ProdukPage(id: widget.id!),
                          center: const FractionalOffset(0.5, 0),
                        ),
                      );
                    }
                  } else {
                    snackBar(context, text: 'Image is Required');
                  }
                } else {
                  print('create barang');
                  CreateBarang createBarang = await JsonFuture().createBarang(
                    name: nama.text,
                    categoryId: categoryId,
                    image: file!,
                    stock: stok.text,
                    deskripsi: deskripsi.text,
                    harga: harga.text,
                  );
                  snackBar(context,
                      text: createBarang.info ?? 'TERJADI KESALAHAN');
                  if (createBarang.code == '00' &&
                      createBarang.data != null &&
                      createBarang.data!.id != null) {
                    await Notifikasi.notif(
                        title: 'Tambah Produk',
                        body:
                            "${createBarang.data!.name!} Berhasil ditambahkan");
                    Navigator.pushReplacement(
                      context,
                      WaveTransition(
                        duration: const Duration(milliseconds: 700),
                        child: ProdukPage(id: createBarang.data!.id!),
                        center: const FractionalOffset(0.5, 0),
                      ),
                    );
                  }
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(15)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Warna().icon),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              child: Text(
                widget.category_id != null &&
                        widget.deskripsi != null &&
                        widget.harga != null &&
                        widget.name != null &&
                        widget.stock != null
                    ? 'UPDATE PRODUK'
                    : 'TAMBAH PRODUK',
                style: Font.style(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      // Column(
      //     children: [
      //       Expanded(
      //         child: ListView(
      //           physics: const BouncingScrollPhysics(),
      //           padding: const EdgeInsets.symmetric(horizontal: 15),
      //           children: [
      //             const SizedBox(height: 20),
      //             Text(
      //               "Nama Produk",
      //               style: Font.style(
      //                 fontWeight: FontWeight.bold,
      //                 color: Warna().font,
      //                 fontSize: 20,
      //               ),
      //             ),
      //             const SizedBox(height: 5),
      //             TextField(
      //               style: Font.style(),
      //               controller: nama,
      //               decoration: InputDecoration(
      //                 hintText: "Masukkan nama produk",
      //                 hintStyle: Font.style(),
      //                 border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(11)),
      //               ),
      //               keyboardType: TextInputType.name,
      //               textInputAction: TextInputAction.next,
      //             ),
      //             const SizedBox(height: 15),
      //             Text(
      //               "Kategori Produk",
      //               style: Font.style(
      //                   fontWeight: FontWeight.bold,
      //                   color: Warna().font,
      //                   fontSize: 20),
      //             ),
      //             DropdownSearch(
      //               items: listkategori,
      //               onChanged: (value) {
      //                 categoryId = value[1];
      //               },
      //               popupProps: const PopupProps.menu(),
      //               dropdownDecoratorProps: DropDownDecoratorProps(
      //                 dropdownSearchDecoration: InputDecoration(
      //                   hintText: "Pilih Kategori",
      //                   hintStyle: Font.style(),
      //                 ),
      //               ),
      //               dropdownButtonProps: DropdownButtonProps(
      //                   color: Warna().font, tooltip: 'Pilih Kategori'),
      //               itemAsString: (item) {
      //                 return item[0];
      //               },
      //             ),
      //             const SizedBox(height: 15),
      //             Text(
      //               "Jumlah Stok Produk",
      //               style: Font.style(
      //                   fontWeight: FontWeight.bold,
      //                   color: Warna().font,
      //                   fontSize: 20),
      //             ),
      //             TextField(
      //               style: Font.style(),
      //               controller: stok,
      //               decoration: InputDecoration(
      //                 hintText: "Masukkan Jumlah Stok",
      //                 hintStyle: Font.style(),
      //                 border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(11)),
      //               ),
      //               keyboardType: TextInputType.name,
      //               textInputAction: TextInputAction.next,
      //             ),
      //             const SizedBox(height: 15),
      //             Text(
      //               "Deskripsi Produk",
      //               style: Font.style(
      //                   fontWeight: FontWeight.bold,
      //                   color: Warna().font,
      //                   fontSize: 20),
      //             ),
      //             TextField(
      //               style: Font.style(),
      //               controller: deskripsi,
      //               maxLines: 5,
      //               decoration: InputDecoration(
      //                 hintText: "Masukkan Deskripsi Produk",
      //                 hintStyle: Font.style(),
      //                 border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(11)),
      //               ),
      //               keyboardType: TextInputType.name,
      //               textInputAction: TextInputAction.next,
      //             ),
      //             const SizedBox(height: 15),
      //             Text(
      //               "Harga Produk",
      //               style: Font.style(
      //                   fontWeight: FontWeight.bold,
      //                   color: Warna().font,
      //                   fontSize: 20),
      //             ),
      //             TextField(
      //               style: Font.style(),
      //               controller: harga,
      //               decoration: InputDecoration(
      //                 hintText: "Masukkan Harga Produk",
      //                 hintStyle: Font.style(),
      //                 border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(11)),
      //               ),
      //               keyboardType: TextInputType.name,
      //               textInputAction: TextInputAction.next,
      //             ),
      //             const SizedBox(height: 15),
      //             Text(
      //               "Foto Produk",
      //               style: Font.style(
      //                   fontWeight: FontWeight.bold,
      //                   color: Warna().font,
      //                   fontSize: 20),
      //             ),
      //             GestureDetector(
      //               onTap: () async {
      //                 XFile? image = await ImagePicker()
      //                     .pickImage(source: ImageSource.gallery);
      //                 if (image != null) {
      //                   file = image.path;
      //                   setState(() {});
      //                 }
      //               },
      //               child: file == null
      //                   ? Assets.lainnyaIcon('add_image', height: 100)
      //                   : Image.file(
      //                       File(file!),
      //                       height: 20,
      //                     ),
      //             ),
      //             const SizedBox(height: 20),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         width: MediaQuery.of(context).size.width,
      //         child: TextButton(
      //           onPressed: () async {
      //             if (nama.text.isNotEmpty &&
      //                 deskripsi.text.isNotEmpty &&
      //                 file != null &&
      //                 harga.text.isNotEmpty &&
      //                 stok.text.isNotEmpty) {
      //               await JsonFuture().createBarang(
      //                 name: nama.text,
      //                 categoryId: categoryId,
      //                 image: file!,
      //                 stock: stok.text,
      //                 deskripsi: deskripsi.text,
      //                 harga: harga.text,
      //               );
      //               Navigator.pushReplacement(
      //                 context,
      //                 WaveTransition(
      //                   duration: const Duration(milliseconds: 700),
      //                   child: ProdukPage(id: widget.id!),
      //                   center: const FractionalOffset(0.5, 0),
      //                 ),
      //               );
      //             } else {
      //               snackBar(context, text: 'Data harus diisi');
      //             }
      //           },
      //           style: ButtonStyle(
      //             padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      //               EdgeInsets.symmetric(vertical: 15),
      //             ),
      //             foregroundColor:
      //                 MaterialStateProperty.all<Color>(Colors.white),
      //             backgroundColor:
      //                 MaterialStateProperty.all<Color>(Warna().icon),
      //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //               RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(50),
      //               ),
      //             ),
      //           ),
      //           child: Text(
      //             'TAMBAH PRODUK',
      //             style: Font.style(
      //               fontSize: 18,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
    );
  }
}
