// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/pages/delvy/create_produk_page.dart';
import 'package:thrilogic_shop/pages/delvy/keranjang_page.dart';
import 'package:thrilogic_shop/pages/opik/splash_login.dart';
import 'package:thrilogic_shop/pages/opik/star_penjual.dart';
import 'package:thrilogic_shop/pages/opik/wishlist_add.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class ProdukPage extends StatefulWidget {
  ProdukPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  int id;

  @override
  State<ProdukPage> createState() => _ProdukPage();
}

class _ProdukPage extends State<ProdukPage> {
  bool nightmode = Storages.getNightMode();
  String nama = Storages.getName();
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Warna().primer,
        extendBodyBehindAppBar: true,
        body: FutureBuilder<GetBarangById>(
            future: JsonFuture().getBarangById(id: widget.id.toString()),
            builder: (context, snapshotBarang) {
              if (snapshotBarang.hasData &&
                  snapshotBarang.connectionState != ConnectionState.waiting &&
                  snapshotBarang.data != null) {
                if (snapshotBarang.data!.data != null) {
                  DataGetBarangById databarang = snapshotBarang.data!.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Image(
                                            image:
                                                NetworkImage(databarang.image!),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(25),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Image(
                                        image: NetworkImage(databarang.image!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BackButton(
                                        color: Warna().icon,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: WishlistAdd(
                                              id: widget.id,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          databarang.name!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Font.style(
                                              fontWeight: FontWeight.bold,
                                              color: Warna().font,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Text(
                                        rupiah(databarang.harga!),
                                        style: Font.style(
                                            fontWeight: FontWeight.bold,
                                            color: Warna().font,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  ReviewStar(
                                    id: widget.id,
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    "Detail Produk",
                                    style: Font.style(
                                        fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Stok",
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Kategori",
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ": ${databarang.stock!}",
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            ": ${databarang.category!.name!}",
                                            maxLines: 5,
                                            style: Font.style(
                                                color: Warna().font,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    "Deskripsi Produk",
                                    style: Font.style(
                                        fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 18),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        modalbottom(context, databarang),
                                    child: Text(
                                      databarang.deskripsi!,
                                      textAlign: TextAlign.justify,
                                      maxLines: 5,
                                      overflow: TextOverflow.fade,
                                      style: Font.style(
                                          color: Warna().font, fontSize: 15),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        modalbottom(context, databarang),
                                    child: Text(
                                      "Baca selengkapnya...",
                                      style: Font.style(
                                        fontSize: 12,
                                        color: Warna().icon,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Text(
                                    "Rekomendasi Produk",
                                    style: Font.style(
                                        fontWeight: FontWeight.bold,
                                        color: Warna().font,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: FutureBuilder<GetKategoriById>(
                                future: JsonFuture().getKategoriById(
                                    id: databarang.categoryId!.toString()),
                                builder: (context, snapshotbyId) {
                                  if (snapshotbyId.hasData &&
                                      snapshotbyId.connectionState !=
                                          ConnectionState.waiting &&
                                      snapshotbyId.data != null &&
                                      snapshotbyId.data!.data != null) {
                                    DataGetKategoriById datakategori =
                                        snapshotbyId.data!.data!;
                                    List<ProductsGetKategoriById> listproducts =
                                        datakategori.products!;
                                    listproducts.shuffle();
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: listproducts.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 10 / 16,
                                      ),
                                      itemBuilder: (context, index) {
                                        ProductsGetKategoriById
                                            productsGetKategoriById =
                                            datakategori.products![index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              WaveTransition(
                                                duration: const Duration(
                                                    milliseconds: 700),
                                                child: ProdukPage(
                                                    id: productsGetKategoriById
                                                        .id!),
                                                center: const FractionalOffset(
                                                    0.5, 0),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              bottom: 20,
                                              left: 10,
                                              right: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                nightmode == false
                                                    ? BoxShadow(
                                                        blurRadius: 4,
                                                        color: Warna().shadow,
                                                        offset:
                                                            const Offset(2, 4),
                                                      )
                                                    : const BoxShadow(),
                                              ],
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Warna().primerCard,
                                              ),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: AspectRatio(
                                                      aspectRatio: 1,
                                                      child: Image.network(
                                                        productsGetKategoriById
                                                            .image!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 5,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            productsGetKategoriById
                                                                .name!,
                                                            style: Font.style(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                          ),
                                                          ReviewStar(
                                                            id: productsGetKategoriById
                                                                .id!,
                                                          ),
                                                          AutoSizeText(
                                                            rupiah(
                                                                productsGetKategoriById
                                                                    .harga!),
                                                            style: Font.style(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Warna().primerCard,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: nama == 'Admin 2'
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            WaveTransition(
                                              duration: const Duration(
                                                  milliseconds: 700),
                                              child: CreateUpdateProdukPage(
                                                id: databarang.id,
                                                image: databarang.image,
                                                category_id: databarang
                                                    .categoryId
                                                    .toString(),
                                                deskripsi: databarang.deskripsi,
                                                harga:
                                                    databarang.harga.toString(),
                                                name: databarang.name,
                                                stock:
                                                    databarang.stock.toString(),
                                              ),
                                              center: const FractionalOffset(
                                                  0.5, 0),
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(
                                            const EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                          ),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Warna().icon),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                left: Radius.circular(50),
                                              ),
                                              side: BorderSide(
                                                  color: Warna().icon),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "PERBARUI",
                                          style: Font.style(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextButton(
                                        onPressed: () async {
                                          DeleteBarang deleteBarang =
                                              await JsonFuture().deleteBarang(
                                            id: widget.id.toString(),
                                          );
                                          snackBar(
                                            context,
                                            text: deleteBarang.info ??
                                                'TERJADI KESALAHAN',
                                          );
                                          if (deleteBarang.code == '00')
                                            Navigator.pushReplacement(
                                              context,
                                              WaveTransition(
                                                duration: const Duration(
                                                    milliseconds: 700),
                                                child:
                                                    ProdukPage(id: widget.id),
                                                center: const FractionalOffset(
                                                    0.5, 0.5),
                                              ),
                                            );
                                        },
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsets>(
                                            const EdgeInsets.symmetric(
                                              vertical: 15,
                                            ),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 3,
                                                  color: Warna().icon),
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                right: Radius.circular(50),
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "HAPUS",
                                          style: Font.style(
                                            fontSize: 18,
                                            color: Warna().icon,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : PlusMinus(
                                  qty: databarang.stock ?? 0,
                                  id: widget.id,
                                ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: lottieAsset('error'),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Warna().terang,
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<dynamic> modalbottom(
      BuildContext context, DataGetBarangById databarang) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => makeDismisibble(
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.6,
          builder: (_, contoller) => Container(
            decoration: BoxDecoration(
                color: Warna().primerCard,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20))),
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: ListView(
              controller: contoller,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        databarang.name!,
                        style: Font.style(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Deskripsi",
                      style:
                          Font.style(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      databarang.deskripsi!,
                      textAlign: TextAlign.justify,
                      style: Font.style(fontSize: 15),
                    ),
                    const SizedBox(height: 15)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeDismisibble({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );
}

class PlusMinus extends StatefulWidget {
  PlusMinus({
    Key? key,
    required this.qty,
    required this.id,
  }) : super(key: key);

  int qty;
  int id;

  @override
  State<PlusMinus> createState() => _PlusMinusState();
}

class _PlusMinusState extends State<PlusMinus> {
  int counter = 1;
  @override
  void initState() {
    if (widget.qty == 0) counter = widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String nama = Storages.getName();
    var cart = context.watch<Cart>();
    return Row(
      // mainAxisAlignment: MainAxisAlignment.s,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (counter > 1) {
                  setState(() {
                    counter -= 1;
                  });
                }
              },
              child: Assets.lainnyaIcon(
                'count_minus',
                height: 30,
                color: Warna().icon,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                counter.toString(),
                style: Font.style(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (counter < widget.qty) {
                  setState(() {
                    counter += 1;
                  });
                }
              },
              child: Assets.lainnyaIcon(
                'count_plus',
                height: 30,
                color: Warna().icon,
              ),
            ),
          ],
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () async {
                if (nama.isEmpty) {
                  Navigator.push(
                    context,
                    WaveTransition(
                      duration: const Duration(milliseconds: 700),
                      child: const SplashLogin(navigate: true),
                      center: const FractionalOffset(0.5, 0),
                    ),
                  );
                } else {
                  CreateKeranjang keranjang =
                      await JsonFuture().createKeranjang(
                    productId: widget.id.toString(),
                    qty: counter.toString(),
                  );
                  snackBar(
                    context,
                    text: keranjang.info ??
                        keranjang.message ??
                        'TERJADI KESALAHAN',
                  );
                  if (keranjang.code == '00') {
                    cart.addcart = 1;
                    Navigator.push(
                      context,
                      WaveTransition(
                        duration: const Duration(milliseconds: 700),
                        child: const Keranjang(),
                        center: const FractionalOffset(0.5, 0),
                      ),
                    );
                  }
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Warna().icon),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: Warna().icon,
                    ),
                  ),
                ),
              ),
              child: Text(
                "ADD CART",
                style: Font.style(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
