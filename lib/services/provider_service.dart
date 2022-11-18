import 'package:flutter/cupertino.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';

class Provide with ChangeNotifier {
  final List<DataGetBarang> _getbarang = [];
  final List<DataGetKategori> _getkategori = [];
  final List<DataGetKeranjang> _getkeranjang = [];
  final List<DataGetReview> _getreview = [];
  final List<DataGetTransaksi> _gettransaksi = [];
  final List<DataGetWishlist> _getwishlist = [];

  List<DataGetBarang> get getbarang => _getbarang;
  set getbarang(List<DataGetBarang> databarang) {
    _getbarang.addAll(databarang);
    notifyListeners();
  }

  List<DataGetKategori> get getkategori => _getkategori;
  set getkategori(List<DataGetKategori> datakategori) {
    _getkategori.addAll(datakategori);
    notifyListeners();
  }

  List<DataGetKeranjang> get getkeranjang => _getkeranjang;
  set getkeranjang(List<DataGetKeranjang> datakeranjang) {
    _getkeranjang.addAll(datakeranjang);
    notifyListeners();
  }

  List<DataGetReview> get getreview => _getreview;
  set getreview(List<DataGetReview> datareview) {
    _getreview.addAll(datareview);
    notifyListeners();
  }

  List<DataGetTransaksi> get gettransaksi => _gettransaksi;
  set gettransaksi(List<DataGetTransaksi> datatransaksi) {
    _gettransaksi.addAll(datatransaksi);
    notifyListeners();
  }

  List<DataGetWishlist> get getwishlist => _getwishlist;
  set getwishlist(List<DataGetWishlist> datawishlist) {
    _getwishlist.addAll(datawishlist);
    notifyListeners();
  }
}
