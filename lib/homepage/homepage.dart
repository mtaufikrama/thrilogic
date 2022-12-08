// ignore_for_file: use_build_context_synchronously

import 'package:badges/badges.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/pages/delvy/keranjang_page.dart';
import 'package:thrilogic_shop/pages/opik/beranda_page.dart';
import 'package:thrilogic_shop/pages/opik/splash_login.dart';
import 'package:thrilogic_shop/pages/opik/wishlist_page.dart';
import 'package:thrilogic_shop/pages/delvy/pesanan_page.dart';
import 'package:thrilogic_shop/pages/yozi/profile_page.dart';
import 'package:thrilogic_shop/pages/opik/search_page.dart';
import 'package:thrilogic_shop/services/icon_assets.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required this.listProducts,
    required this.listDataKategori,
    required this.getkeranjang,
    required this.selectedIndex,
  });
  List<ProductsGetKategoriById> listProducts;
  List<DataGetKategoriById> listDataKategori;
  GetKeranjang getkeranjang;
  int selectedIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool nightmode = Storages.getNightMode();
  String nama = Storages.getName();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.selectedIndex,
      length: 4,
      child: Scaffold(
        backgroundColor: Warna().primer,
        appBar: widget.selectedIndex == 3
            ? null
            : AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 70,
                elevation: 0,
                backgroundColor: Warna().first,
                title: Assets.logo(width: 130),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          center: const FractionalOffset(0.9, 0.0),
                          child: SearchPage(
                            listProducts: widget.listProducts,
                          ),
                        ),
                      );
                    },
                    child: Assets.appbarIcon('search', width: 25),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  nama.isNotEmpty && Storages.getLengthCart() != 0
                      ? Badge(
                          badgeColor: Warna().font,
                          position: BadgePosition.topEnd(
                            top: 5,
                            end: -5,
                          ),
                          badgeContent: Text(
                            Storages.getLengthCart().toString(),
                            style: Font.style(color: Warna().primer),
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                context,
                                WaveTransition(
                                  duration: const Duration(milliseconds: 700),
                                  child: const Keranjang(),
                                  center: const FractionalOffset(0.9, 0.0),
                                ),
                              );
                            },
                            child: Assets.appbarIcon('cart'),
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              WaveTransition(
                                duration: const Duration(milliseconds: 700),
                                child: SplashLogin(navigate: true),
                                center: const FractionalOffset(0.9, 0.0),
                              ),
                            );
                          },
                          child: Assets.appbarIcon('cart', width: 25),
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: DayNightSwitcherIcon(
                      isDarkModeEnabled: nightmode,
                      onStateChanged: (isDarkModeEnabled) async {
                        await Storages().setNightMode(
                          nightMode: nightmode == false ? true : false,
                        );
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 500),
                            child: HomePage(
                              listProducts: widget.listProducts,
                              listDataKategori: widget.listDataKategori,
                              getkeranjang: widget.getkeranjang,
                              selectedIndex: widget.selectedIndex,
                            ),
                            center: const FractionalOffset(0.9, 0.0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Beranda(
                        listProducts: widget.listProducts,
                        listDataKategori: widget.listDataKategori,
                      ),
                      nama.isNotEmpty
                          ? const WishList()
                          : SplashLogin(navigate: false),
                      nama.isNotEmpty
                          ? const Pesanan()
                          : SplashLogin(navigate: false),
                      nama.isNotEmpty
                          ? const Profile()
                          : SplashLogin(navigate: false),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
              ],
            ),
            Column(
              children: [
                Expanded(child: Container()),
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Warna().primerCard,
                    boxShadow: [
                      nightmode == false
                          ? BoxShadow(
                              blurRadius: 7,
                              color: Warna().shadow,
                              offset: const Offset(2, 4))
                          : const BoxShadow(),
                    ],
                  ),
                  height: 75,
                  child: TabBar(
                    onTap: (value) {
                      setState(() {
                        widget.selectedIndex = value;
                      });
                    },
                    labelColor: Warna().first,
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        icon: Tooltip(
                          message: 'Beranda',
                          child: Assets.navbarIcon(
                              widget.selectedIndex != 0 ? 'home' : 'homeon'),
                        ),
                      ),
                      Tab(
                        icon: Tooltip(
                          message: 'Wishlist',
                          child: Assets.navbarIcon(
                              widget.selectedIndex != 1 ? 'heart' : 'hearton'),
                        ),
                      ),
                      Tab(
                        icon: Tooltip(
                          message: 'Transaksi',
                          child: Assets.navbarIcon(
                              widget.selectedIndex != 2 ? 'note' : 'noteon'),
                        ),
                      ),
                      Tab(
                        icon: Tooltip(
                          message: 'Profil',
                          child: Assets.navbarIcon(
                              widget.selectedIndex != 3 ? 'user' : 'useron'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
