// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/pages/delvy/produk_page.dart';
import 'package:thrilogic_shop/pages/opik/keranjang_add.dart';
import 'package:thrilogic_shop/pages/opik/star_penjual.dart';
import 'package:thrilogic_shop/pages/opik/wishlist_add.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class CardGrid extends StatelessWidget {
  CardGrid({
    super.key,
    required this.listProducts,
    required this.index,
  });

  List<ProductsGetKategoriById> listProducts;
  int index;
  bool nightmode = Storages.getNightMode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          WaveTransition(
            duration: const Duration(milliseconds: 700),
            child: ProdukPage(id: listProducts[index].id!),
            center: const FractionalOffset(0.5, 0),
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
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            nightmode == false
                ? BoxShadow(
                    blurRadius: 4,
                    color: Warna().shadow,
                    offset: const Offset(2, 4),
                  )
                : const BoxShadow(),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Warna().primerCard,
          ),
          child: Column(
            children: [
              GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Image.network(
                          listProducts[index].image!,
                        ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      listProducts[index].image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Tooltip(
                              message: listProducts[index].name!,
                              child: Text(
                                listProducts[index].name!,
                                style: Font.style(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Tooltip(
                            message: "Tambah Ke Wishlist",
                            child: WishlistAdd(
                              id: listProducts[index].id!,
                            ),
                          ),
                        ],
                      ),
                      Tooltip(
                        message: 'Rating Produk',
                        child: ReviewStar(
                          id: listProducts[index].id!,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Tooltip(
                              message: listProducts[index].harga!.toString(),
                              child: AutoSizeText(
                                rupiah(listProducts[index].harga!),
                                style: Font.style(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Tooltip(
                            message: 'Tambah Ke Keranjang',
                            child: KeranjangAdd(
                              id: listProducts[index].id!,
                            ),
                          ),
                        ],
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
  }
}
