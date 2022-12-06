import 'package:flutter/material.dart';
import 'package:thrilogic_shop/services/local_storages.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({
    Key? key,
  }) : super(key: key);

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  String nama = Storages.getName();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
