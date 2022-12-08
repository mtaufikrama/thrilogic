import 'package:flutter/material.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/auth.dart';
import 'package:thrilogic_shop/homepage/integrate.dart';
import 'package:thrilogic_shop/pages/delvy/create_produk_page.dart';
import 'package:thrilogic_shop/pages/delvy/list_alamat_page.dart';
import 'package:thrilogic_shop/pages/yozi/login_page.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Warna().primer,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: defaultPadding * 2),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Image(
                    image: AssetImage(
                      'assets/img/img2.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      CircleAvatar(
                        backgroundColor: Warna().icon,
                        child: Text(
                          Storages.getName().substring(0, 1).toUpperCase(),
                          style: Font.style(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        radius: 45,
                      ),
                      SizedBox(height: 15),
                      Text(
                        Storages.getName().toUpperCase(),
                        style: Font.style(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        Storages.getEmail(),
                        style: Font.style(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Storages.getName() != 'admin'
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          child: ListAlamatPage(),
                          center: const FractionalOffset(0.9, 0.0),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Card(
                        color: Warna().primerCard,
                        child: ListTile(
                          title: Text(
                            'Shipping Address',
                            style: Font.style(),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Warna().font,
                          ),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        WaveTransition(
                          duration: const Duration(milliseconds: 700),
                          child: CreateUpdateProdukPage(),
                          center: const FractionalOffset(0.9, 0.0),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Card(
                        color: Warna().primerCard,
                        child: ListTile(
                          title: Text(
                            'Tambah Produk',
                            style: Font.style(),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Warna().font,
                          ),
                        ),
                      ),
                    ),
                  ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Warna().primerCard,
                      title: Text(
                        'LOGOUT',
                        style: Font.style(),
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      actions: [
                        ElevatedButton(
                          autofocus: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.clear_rounded,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Warna().icon,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            Logout logout = await JsonFuture().logout();
                            snackBar(context,
                                text: logout.info ?? 'TERJADI KESALAHAN');
                            if (logout.info != null)
                              Navigator.pushReplacement(
                                context,
                                WaveTransition(
                                  duration: const Duration(milliseconds: 700),
                                  child: const IntegrateAPI(),
                                  center: const FractionalOffset(0.5, 0.0),
                                ),
                              );
                          },
                          child: Icon(Icons.done, color: Warna().icon),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: CircleBorder(),
                            backgroundColor: Warna().primerCard,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Card(
                  color: Warna().primerCard,
                  child: ListTile(
                    title: Text(
                      'Logout',
                      style: Font.style(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Warna().font,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
