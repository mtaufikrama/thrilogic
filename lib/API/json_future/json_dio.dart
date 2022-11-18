// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:thrilogic_shop/API/object_class/auth.dart';
// import 'package:thrilogic_shop/API/object_class/barang.dart';
// import 'package:thrilogic_shop/API/object_class/category.dart';
// import 'package:thrilogic_shop/API/object_class/keranjang.dart';
// import 'package:thrilogic_shop/API/object_class/review.dart';
// import 'package:thrilogic_shop/API/object_class/transaksi.dart';
// import 'package:thrilogic_shop/API/object_class/wishlist.dart';
// import 'package:thrilogic_shop/services/local_storages.dart';

// class JsonFuture {
//   String baseUrl = 'Dio()s://api1.sib3.nurulfikri.com';
//   String token = Storages.getToken().isNotEmpty
//       ? Storages.getToken()
//       : '103|8D4nu4078lyL3QDZQsa9gyaL0KWq0OC21BZiOYuY';

//   Future<Login> login({
//     required String email,
//     required String password,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/login',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       data: jsonEncode(
//         <String, dynamic>{
//           'email': email,
//           'password': password,
//         },
//       ),
//     );
//     return Login.fromJson(jsonDecode(response.data));
//   }

//   Future<Register> register({
//     required String name,
//     required String email,
//     required String handphone,
//     required String password,
//     required String passwordConfirmation,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/register',
//       data: jsonEncode(
//         <String, dynamic>{
//           'name': name,
//           'email': email,
//           'handphone': handphone,
//           'password': password,
//           'password_confirmation': passwordConfirmation,
//         },
//       ),
//     );
//     return Register.fromJson(jsonDecode(response.data));
//   }

//   Future<Logout> logout({
//     required String token,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/logout',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//     );
//     return Logout.fromJson(jsonDecode(response.data));
//   }

//   Future<GetBarang> getBarang() async {
//     Response response =
//         await Dio().get('$baseUrl/api/barang', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetBarang.fromJson(jsonDecode(response.data));
//   }

//   Future<GetBarang> searchBarang(
//       {String? search, String? sortBy, String? sortOrder}) async {
//     Response response = await Dio().get(
//         '$baseUrl/api/barang/?search=$search&sortBy=$sortBy&sortOrder=$sortOrder',
//         queryParameters: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });
//     return GetBarang.fromJson(jsonDecode(response.data));
//   }

//   Future<GetBarangById> getBarangById({required String id}) async {
//     Response response =
//         await Dio().get('$baseUrl/api/barang/$id', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetBarangById.fromJson(jsonDecode(response.data));
//   }

//   Future<CreateBarang> createBarang({
//     required String name,
//     required String categoryId,
//     required String image,
//     required String stock,
//     required String deskripsi,
//     required String harga,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/admin/barang',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       data: jsonEncode(
//         <String, dynamic>{
//           'name': name,
//           'category_id': categoryId,
//           'image': image,
//           'stock': stock,
//           'deskripsi': deskripsi,
//           'harga': harga,
//         },
//       ),
//     );
//     return CreateBarang.fromJson(jsonDecode(response.data));
//   }

//   Future<UpdateBarang> updateBarang({
//     required String id,
//     required String name,
//     required String categoryId,
//     required String image,
//     required String stock,
//     required String deskripsi,
//     required String harga,
//   }) async {
//     Response response = await Dio().post('$baseUrl/api/admin/barang/$id',
//         queryParameters: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//         data: jsonEncode(<String, dynamic>{
//           'name': name,
//           'category_id': categoryId,
//           'image': image,
//           'stock': stock,
//           'deskripsi': deskripsi,
//           'harga': harga,
//         }));
//     return UpdateBarang.fromJson(jsonDecode(response.data));
//   }

//   Future<DeleteBarang> deleteBarang({required String id}) async {
//     Response response =
//         await Dio().delete('$baseUrl/api/admin/barang/$id', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return DeleteBarang.fromJson(jsonDecode(response.data));
//   }

//   Future<GetKategori> getKategori() async {
//     Response response =
//         await Dio().get('$baseUrl/api/category', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetKategori.fromJson(jsonDecode(response.data));
//   }

//   Future<GetKategoriById> getKategoriById({required String id}) async {
//     Response response =
//         await Dio().get('$baseUrl/api/barang', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetKategoriById.fromJson(jsonDecode(response.data));
//   }

//   Future<CreateKategori> createKategori({required String name}) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/admin/category',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       data: jsonEncode(<String, dynamic>{
//         'name': name,
//       }),
//     );
//     return CreateKategori.fromJson(jsonDecode(response.data));
//   }

//   Future<UpdateKategori> updateKategori({
//     required String id,
//     required String name,
//   }) async {
//     Response response = await Dio().put(
//       '$baseUrl/api/admin/category/$id',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       data: jsonEncode(<String, dynamic>{
//         'name': name,
//       }),
//     );
//     return UpdateKategori.fromJson(jsonDecode(response.data));
//   }

//   Future<DeleteKategori> deleteKategori({
//     required String id,
//   }) async {
//     Response response =
//         await Dio().delete('$baseUrl/api/admin/category/$id', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return DeleteKategori.fromJson(jsonDecode(response.data));
//   }

//   Future<GetReview> getReview({required String productId}) async {
//     Response response =
//         await Dio().get('$baseUrl/api/review/$productId', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetReview.fromJson(jsonDecode(response.data));
//   }

//   Future<CreateReview> createReview({
//     required String id,
//     required String star,
//     required String review,
//     required String image,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/review/$id',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       data: jsonEncode(<String, dynamic>{
//         'star': star,
//         'review': review,
//         'image': image,
//       }),
//     );
//     return CreateReview.fromJson(jsonDecode(response.data));
//   }

//   Future<DeleteReview> deleteReview({
//     required String id,
//   }) async {
//     Response response =
//         await Dio().delete('$baseUrl/api/review/$id', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return DeleteReview.fromJson(jsonDecode(response.data));
//   }

//   Future<GetWishlist> getWishlist() async {
//     Response response =
//         await Dio().get('$baseUrl/api/wishlist', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetWishlist.fromJson(jsonDecode(response.data));
//   }

//   Future<CreateWishlist> createWishlist({
//     required String productId,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/wishlist',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       data: jsonEncode(<String, dynamic>{
//         'product_id': productId,
//       }),
//     );
//     return CreateWishlist.fromJson(jsonDecode(response.data));
//   }

//   Future<DeleteWishlist> deleteWishlist({
//     required String id,
//   }) async {
//     Response response =
//         await Dio().delete('$baseUrl/api/wishlist/$id', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return DeleteWishlist.fromJson(jsonDecode(response.data));
//   }

//   Future<GetKeranjang> getKeranjang() async {
//     Response response =
//         await Dio().get('$baseUrl/api/keranjang', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetKeranjang.fromJson(jsonDecode(response.data));
//   }

//   Future<CreateKeranjang> createKeranjang({
//     required String productId,
//     required String qty,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/keranjang',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       data: jsonEncode(<String, dynamic>{
//         'product_id': productId,
//         'qty': qty,
//       }),
//     );
//     return CreateKeranjang.fromJson(jsonDecode(response.data));
//   }

//   Future<DeleteKeranjang> deleteKeranjang({
//     required String id,
//   }) async {
//     Response response =
//         await Dio().delete('$baseUrl/api/keranjang/$id', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return DeleteKeranjang.fromJson(jsonDecode(response.data));
//   }

//   Future<GetTransaksi> getTransaksi() async {
//     Response response =
//         await Dio().get('$baseUrl/api/transaksi', queryParameters: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     return GetTransaksi.fromJson(jsonDecode(response.data));
//   }

//   Future<CreateTransaksi> createTransaksi({
//     required String alamat,
//   }) async {
//     Response response = await Dio().post(
//       '$baseUrl/api/transaksi',
//       queryParameters: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       data: jsonEncode(<String, dynamic>{
//         'alamat': alamat,
//       }),
//     );
//     return CreateTransaksi.fromJson(jsonDecode(response.data));
//   }
// }
