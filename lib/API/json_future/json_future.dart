import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:thrilogic_shop/API/object_class/auth.dart';
import 'package:thrilogic_shop/API/object_class/barang.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/API/object_class/review.dart';
import 'package:thrilogic_shop/API/object_class/transaksi.dart';
import 'package:thrilogic_shop/API/object_class/wishlist.dart';
import 'package:thrilogic_shop/services/local_storages.dart';

class JsonFuture {
  String baseUrl = 'https://api1.sib3.nurulfikri.com';
  String token = Storages.getToken().isNotEmpty
      ? Storages.getToken()
      : '697|Z6ACYeukGQ24snxrujh0Ymz7YtgwmL5u90xe276Y';

  Future<Login> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'email': email,
          'password': password,
        },
      ),
    );
    var data = Login.fromJson(jsonDecode(response.body));
    if (data.code! == '00' && data.data != null) {
      await Storages().setNoTelp(nomorTelepon: data.data!.user!.handphone!);
      await Storages().setName(name: data.data!.user!.name ?? '');
      await Storages().setToken(token: data.data!.token!);
    }
    return data;
  }

  Future<Register> register({
    required String name,
    required String email,
    required String handphone,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/register'),
      body: jsonEncode(
        <String, dynamic>{
          'name': name,
          'email': email,
          'handphone': handphone,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      ),
    );
    return Register.fromJson(jsonDecode(response.body));
  }

  Future<Logout> logout({
    required String token,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/logout'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    await Storages().logout();
    return Logout.fromJson(jsonDecode(response.body));
  }

  Future<GetBarang> getBarang() async {
    final response = await http.get(Uri.parse('$baseUrl/api/barang'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetBarang.fromJson(jsonDecode(response.body));
  }

  Future<GetBarang> searchBarang(
      {String? search, String? sortBy, String? sortOrder}) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl/api/barang/?search=$search&sortBy=$sortBy&sortOrder=$sortOrder'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    return GetBarang.fromJson(jsonDecode(response.body));
  }

  Future<GetBarangById> getBarangById({required String id}) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/barang/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetBarangById.fromJson(jsonDecode(response.body));
  }

  Future<CreateBarang> createBarang({
    required String name,
    required String categoryId,
    required String image,
    required String stock,
    required String deskripsi,
    required String harga,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/admin/barang'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        <String, dynamic>{
          'name': name,
          'category_id': categoryId,
          'image': image,
          'stock': stock,
          'deskripsi': deskripsi,
          'harga': harga,
        },
      ),
    );
    return CreateBarang.fromJson(jsonDecode(response.body));
  }

  Future<UpdateBarang> updateBarang({
    required String id,
    required String name,
    required String categoryId,
    required String image,
    required String stock,
    required String deskripsi,
    required String harga,
  }) async {
    final response = await http.post(Uri.parse('$baseUrl/api/admin/barang/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'category_id': categoryId,
          'image': image,
          'stock': stock,
          'deskripsi': deskripsi,
          'harga': harga,
        }));
    return UpdateBarang.fromJson(jsonDecode(response.body));
  }

  Future<DeleteBarang> deleteBarang({required String id}) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/api/admin/barang/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return DeleteBarang.fromJson(jsonDecode(response.body));
  }

  Future<GetKategori> getKategori() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/category'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetKategori.fromJson(jsonDecode(response.body));
  }

  Future<GetKategoriById> getKategoriById({required String id}) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/category/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetKategoriById.fromJson(jsonDecode(response.body));
  }

  Future<CreateKategori> createKategori({required String name}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/admin/category'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
      }),
    );
    return CreateKategori.fromJson(jsonDecode(response.body));
  }

  Future<UpdateKategori> updateKategori({
    required String id,
    required String name,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/admin/category/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
      }),
    );
    return UpdateKategori.fromJson(jsonDecode(response.body));
  }

  Future<DeleteKategori> deleteKategori({
    required String id,
  }) async {
    final response = await http
        .delete(Uri.parse('$baseUrl/api/admin/category/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return DeleteKategori.fromJson(jsonDecode(response.body));
  }

  Future<GetReview> getReview({required String productId}) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/review/$productId'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetReview.fromJson(jsonDecode(response.body));
  }

  Future<CreateReview> createReview({
    required String id,
    required String star,
    required String review,
    required String image,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/review/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'star': star,
        'review': review,
        'image': image,
      }),
    );
    return CreateReview.fromJson(jsonDecode(response.body));
  }

  Future<DeleteReview> deleteReview({
    required String id,
  }) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/api/review/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return DeleteReview.fromJson(jsonDecode(response.body));
  }

  Future<GetWishlist> getWishlist() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/wishlist'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetWishlist.fromJson(jsonDecode(response.body));
  }

  Future<CreateWishlist> createWishlist({
    required String productId,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/wishlist'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'product_id': productId,
      }),
    );
    return CreateWishlist.fromJson(jsonDecode(response.body));
  }

  Future<DeleteWishlist> deleteWishlist({
    required String id,
  }) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/api/wishlist/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return DeleteWishlist.fromJson(jsonDecode(response.body));
  }

  Future<GetKeranjang> getKeranjang() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/keranjang'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetKeranjang.fromJson(jsonDecode(response.body));
  }

  Future<CreateKeranjang> createKeranjang({
    required String productId,
    required String qty,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/keranjang'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'product_id': productId,
        'qty': qty,
      }),
    );
    return CreateKeranjang.fromJson(jsonDecode(response.body));
  }

  Future<DeleteKeranjang> deleteKeranjang({
    required String id,
  }) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/api/keranjang/$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return DeleteKeranjang.fromJson(jsonDecode(response.body));
  }

  Future<GetTransaksi> getTransaksi() async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/transaksi'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return GetTransaksi.fromJson(jsonDecode(response.body));
  }

  Future<CreateTransaksi> createTransaksi({
    required String alamat,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/transaksi'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'alamat': alamat,
      }),
    );
    return CreateTransaksi.fromJson(jsonDecode(response.body));
  }
}
