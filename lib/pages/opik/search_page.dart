import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    required this.listProducts,
    Key? key,
  }) : super(key: key);
  List<ProductsGetKategoriById> listProducts;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.listProducts.shuffle();
    return Scaffold(
      backgroundColor: Warna().primer,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Warna().first,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Warna().putih,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            autofocus: true,
            controller: search,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: Warna().font,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: "Cari Nama Produk",
              hintStyle: Font.style(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: search.text.isNotEmpty
              ? FutureBuilder<GetBarang>(
                  future: JsonFuture().searchBarang(
                    search: search.text,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      List<DataGetBarang> dataBarang =
                          snapshot.data!.data ?? [];
                      dataBarang.sort(
                        (a, b) => a.name!.compareTo(b.name!),
                      );
                      return dataBarang.isEmpty || snapshot.data!.data == null
                          ? Center(
                              child: lottieAsset(
                                'error',
                                width: MediaQuery.of(context).size.width * 0.8,
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dataBarang.length,
                              itemBuilder: (context, index) {
                                DataGetBarang barang = dataBarang[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      WaveTransition(
                                        duration:
                                            const Duration(milliseconds: 700),
                                        child: ProdukPage(id: barang.id!),
                                        center: const FractionalOffset(0.5, 0),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    color: Warna().primerCard,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                              barang.image!,
                                              fit: BoxFit.cover,
                                              width: 70,
                                              height: 70,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  barang.name!,
                                                  style: Font.style(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  barang.category != null
                                                      ? barang.category!.name!
                                                      : 'null',
                                                  style: Font.style(),
                                                ),
                                                Text(
                                                  rupiah(barang.harga!),
                                                  style: Font.style(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
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
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 200,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Warna().terang,
                          ),
                        ),
                      );
                    }
                  },
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.listProducts.length,
                  itemBuilder: (context, index) {
                    List<ProductsGetKategoriById> listproducts =
                        widget.listProducts;
                    listproducts.sort((a, b) => a.name!.compareTo(b.name!));
                    ProductsGetKategoriById barang = listproducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: ProdukPage(id: barang.id!),
                            center: const FractionalOffset(0.5, 0),
                          ),
                        );
                      },
                      child: Card(
                        color: Warna().primerCard,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  barang.image!,
                                  fit: BoxFit.cover,
                                  width: 60,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      barang.name!,
                                      style: Font.style(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      barang.deskripsi!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Font.style(fontSize: 12),
                                    ),
                                    Text(
                                      rupiah(barang.harga!),
                                      style: Font.style(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
