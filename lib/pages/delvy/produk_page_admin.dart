import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/pages/opik/kategori_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';
import 'package:google_fonts/google_fonts.dart';

class ProdukPageAdmin extends StatefulWidget {
  const ProdukPageAdmin({
    Key? key,
  }) : super(key: key);

  @override
  State<ProdukPageAdmin> createState() => _ProdukPageAdmin();
}

class _ProdukPageAdmin extends State<ProdukPageAdmin> {
  int gottenStars = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna().primer,
      body: Stack(children: [
        Positioned(
          top: 420,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Frill-trimmed Chiffon Blouse",
                      style: Font.style(
                          fontWeight: FontWeight.bold,
                          color: Warna().font,
                          fontSize: 20),
                    ),
                    Text(
                      "Rp 120.000",
                      style: Font.style(
                          fontWeight: FontWeight.bold,
                          color: Warna().font,
                          fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: gottenStars > (index)
                                    ? Colors.yellow
                                    : Colors.grey,
                                size: 15);
                          }),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "(4.0)",
                          style: Font.style(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Color.fromARGB(255, 213, 58, 58),
                          size: 25,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Deskripsi",
                  style: Font.style(
                      fontWeight: FontWeight.bold,
                      color: Warna().font,
                      fontSize: 18),
                ),
                Text(
                  textAlign: TextAlign.justify,
                  "Blus berpotongan lurus dengan bahan sifon lapang. Kerah stand-up smock dengan hiasan embel-embel kecil, dan bukaan yang dalam di bagian belakang dengan kancing tertutup di bagian belakang leher. Kuk bersusun dua lapis, berjumbai, dan lengan terompet panjang dan lebar dengan elastisitas tipis dan tali serut di sekitar pergelangan tangan.",
                  style: Font.style(color: Warna().font, fontSize: 15),
                ),
                TextButton(
                  onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => buildSheet()),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 0),
                    ),
                  ),
                  child: Text("Baca selengkapnya...",
                      style: Font.style(fontSize: 12, color: Warna().font)),
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: 440,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ],
                image: const DecorationImage(
                  image: AssetImage("assets/img/BLOUSE9.png"),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 15)),
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
                child: Text("Perbarui", style: Font.style(fontSize: 18)),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
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
                child: Text("Hapus", style: Font.style(fontSize: 18)),
              ),
            ],
          ),
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
      ]),
    );
  }

  Widget buildSheet() => makeDismisibble(
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.6,
          builder: (_, contoller) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            padding: const EdgeInsets.all(18),
            child: ListView(
              controller: contoller,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Frill-trimmed Chiffon Blouse",
                        style: Font.style(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                      textAlign: TextAlign.justify,
                      "Blus berpotongan lurus dengan bahan sifon lapang. Kerah stand-up smock dengan hiasan embel-embel kecil, dan bukaan yang dalam di bagian belakang dengan kancing tertutup di bagian belakang leher. Kuk bersusun dua lapis, berjumbai, dan lengan terompet panjang dan lebar dengan elastisitas tipis dan tali serut di sekitar pergelangan tangan.\n",
                      style: Font.style(fontSize: 15),
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      " Kondisi                  : Bekas\n Ukuran                 : Fit to L Bekas\n Lingkar Dada      : 100 cm - 110 cm\n Panjang Baju	     : 75 cm \n Panjang Lengan : 48 cm\n Bahan                   : Polyester \n Gaya                     : Stand-up collar\n Konsep                 : Everyday Fashion\n",
                      style: Font.style(fontSize: 15),
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      "Note : Warna sesuai Foto, tetapi efek pencahayaan foto dan settingan layar gadget kamu mungkin berbeda sehingga mempengaruhi warna baju, jadi harap maklum. Kami akan lakukan sebaik mungkin untuk menyamakan warna seperti di Foto.\n\n Happy Trifting!",
                      style: Font.style(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget makeDismisibble({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );
}
