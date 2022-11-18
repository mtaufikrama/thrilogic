import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';

class StreamJson {
  Stream<GetBarang> getBarang() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      GetBarang someProduct = GetBarang();
      yield someProduct;
    }
  }

  Stream<GetKategori> getKategori() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      GetKategori someProduct = GetKategori();
      yield someProduct;
    }
  }

  Stream<GetKeranjang> getKeranjang() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      GetKeranjang someProduct = GetKeranjang();
      yield someProduct;
    }
  }

  Stream<GetReview> getReview() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      GetReview someProduct = GetReview();
      yield someProduct;
    }
  }

  Stream<GetTransaksi> getTransaksi() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      GetTransaksi someProduct = GetTransaksi();
      yield someProduct;
    }
  }

  Stream<GetWishlist> getWishlist() async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 500));
      GetWishlist someProduct = GetWishlist();
      yield someProduct;
    }
  }
}
