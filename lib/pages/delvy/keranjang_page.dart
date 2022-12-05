// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/pages/delvy/pembayaran_page.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

import '../../API/object_class/keranjang.dart';

class Keranjang extends StatefulWidget {
  Keranjang({
    required this.panjangkeranjangbaru,
    required this.panjangkeranjanglama,
    required this.keranjang,
    // required this.kategori,
    Key? key,
  }) : super(key: key);

  int panjangkeranjangbaru;
  int panjangkeranjanglama;
  GetKeranjang keranjang;

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  // GetKategori kategori;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Keranjang"),
        backgroundColor: Warna().first,
        foregroundColor: Warna().primer,
        centerTitle: false,
      ),
      body: widget.panjangkeranjangbaru > widget.panjangkeranjanglama
          ? FutureBuilder<GetKeranjang>(
              future: JsonFuture().getKeranjang(),
              builder: (context, snapshotGetKeranjang) {
                if (snapshotGetKeranjang.hasData &&
                    snapshotGetKeranjang.connectionState !=
                        ConnectionState.waiting &&
                    snapshotGetKeranjang.data != null) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Total Keranjang ( ${widget.keranjang.data == null ? 0 : widget.keranjang.data!.length} )",
                          // "Total Keranjang (5)",
                          style: Font.style(
                              fontWeight: FontWeight.bold,
                              color: Warna().font,
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.keranjang.data == null
                                ? 0
                                : widget.keranjang.data!.length,
                            itemBuilder: (context, index) => Card(
                              // color: Color.fromARGB(0, 255, 15, 15),
                              child: ListTile(
                                tileColor: Warna().primerCard,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(snapshotGetKeranjang
                                        .data!.data![index].product!.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshotGetKeranjang.data!
                                              .data![index].product!.name!,
                                          style: Font.style(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FutureBuilder(
                                              future: JsonFuture()
                                                  .getKategoriById(
                                                      id: snapshotGetKeranjang
                                                          .data!
                                                          .data![index]
                                                          .product!
                                                          .categoryId
                                                          .toString()),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData &&
                                                    snapshot.connectionState !=
                                                        ConnectionState
                                                            .waiting &&
                                                    snapshot.data != null &&
                                                    snapshot.data!.data !=
                                                        null) {
                                                  return Text(
                                                    snapshot.data!.data!.name ??
                                                        'No Kategori',
                                                    style: Font.style(
                                                      fontSize: 12,
                                                    ),
                                                  );
                                                } else {
                                                  return Text(
                                                    'waiting..',
                                                    style: Font.style(),
                                                  );
                                                }
                                              },
                                            ),
                                            Text(
                                              "${snapshotGetKeranjang.data!.data![index].qty!} pcs",
                                              style: Font.style(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          rupiah(
                                            snapshotGetKeranjang.data!
                                                .data![index].product!.harga!,
                                          ),
                                          style: Font.style(
                                            color: Warna().font,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                  onPressed: () async {
                                    DeleteKeranjang deleteKeranjang =
                                        await JsonFuture().deleteKeranjang(
                                            id: snapshotGetKeranjang
                                                .data!.data![index].id!
                                                .toString());
                                    snackBar(
                                      context,
                                      text: deleteKeranjang.info ??
                                          "TERJADI KESALAHAN",
                                    );
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Total ",
                                        style: Font.style(
                                            fontWeight: FontWeight.bold,
                                            color: Warna().font,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        "( ${widget.keranjang.data == null ? 0 : widget.keranjang.data!.length} Produk )",
                                        style: Font.style(
                                          // fontWeight: FontWeight.bold,
                                          color: Warna().font,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Rp 301.321",
                                    // rupiah(keranjang.data![index].product!.harga!),
                                    style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      WaveTransition(
                                        duration:
                                            const Duration(milliseconds: 700),
                                        child: PembayaranPage(
                                            dataKeranjang: widget.keranjang),
                                        center: const FractionalOffset(0.5, 0),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 15)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Warna().first),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                          color: Warna().first,
                                        ),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Beli Semua",
                                    style: Font.style(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
          : Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Total Keranjang ( ${widget.keranjang.data == null ? 0 : widget.keranjang.data!.length} )",
                    // "Total Keranjang (5)",
                    style: Font.style(
                        fontWeight: FontWeight.bold,
                        color: Warna().font,
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.keranjang.data == null
                            ? 0
                            : widget.keranjang.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              tileColor: Warna().primerCard,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: NetworkImage(widget
                                      .keranjang.data![index].product!.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.keranjang.data![index].product!
                                              .name!,
                                          style: Font.style(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            FutureBuilder<GetKategoriById>(
                                              future:
                                                  JsonFuture().getKategoriById(
                                                id: widget
                                                    .keranjang
                                                    .data![index]
                                                    .product!
                                                    .categoryId
                                                    .toString(),
                                              ),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData &&
                                                    snapshot.connectionState !=
                                                        ConnectionState
                                                            .waiting &&
                                                    snapshot.data != null &&
                                                    snapshot.data!.data !=
                                                        null) {
                                                  return Text(
                                                    snapshot.data!.data!.name ??
                                                        'No Kategori',
                                                    style: Font.style(
                                                      fontSize: 12,
                                                    ),
                                                  );
                                                } else {
                                                  return Text(
                                                    'waiting..',
                                                    style: Font.style(),
                                                  );
                                                }
                                              },
                                            ),
                                            Text(
                                              "${widget.keranjang.data![index].qty!} pcs",
                                              style: Font.style(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          rupiah(
                                            widget.keranjang.data![index]
                                                .product!.harga!,
                                          ),
                                          style: Font.style(
                                            color: Warna().font,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                                onPressed: () async {
                                  DeleteKeranjang deleteKeranjang =
                                      await JsonFuture().deleteKeranjang(
                                          id: widget.keranjang.data![index].id!
                                              .toString());
                                  snackBar(
                                    context,
                                    text: deleteKeranjang.info ??
                                        "TERJADI KESALAHAN",
                                  );
                                  setState(() {});
                                },
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total ",
                                  style: Font.style(
                                      fontWeight: FontWeight.bold,
                                      color: Warna().font,
                                      fontSize: 17),
                                ),
                                Text(
                                  "( ${widget.keranjang.data == null ? 0 : widget.keranjang.data!.length} Produk )",
                                  style: Font.style(
                                    // fontWeight: FontWeight.bold,
                                    color: Warna().font,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Rp 301.321",
                              // rupiah(keranjang.data![index].product!.harga!),
                              style: Font.style(
                                fontWeight: FontWeight.bold,
                                color: Warna().font,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                WaveTransition(
                                  duration: const Duration(milliseconds: 700),
                                  child: PembayaranPage(
                                      dataKeranjang: widget.keranjang),
                                  center: const FractionalOffset(0.5, 0),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(vertical: 15)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Warna().terang),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            child: Text(
                              "Beli Semua",
                              style:
                                  Font.style(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
