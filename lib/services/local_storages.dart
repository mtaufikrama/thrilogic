import 'package:localstorage/localstorage.dart';

class Storages {
  static LocalStorage storages = LocalStorage('thrilogic');

  Future<bool> ready() async {
    final ready = storages.ready;
    return ready;
  }

  Future<void> setToken({required String token}) async =>
      await storages.setItem('token', token);

  Future<void> setName({required String name}) async =>
      await storages.setItem('name', name);
  Future<void> setNoTelp({required String nomorTelepon}) async =>
      await storages.setItem('nomorTelepon', nomorTelepon);

  Future<void> setNightMode({required bool nightMode}) async =>
      await storages.setItem('nightMode', nightMode);

  Future<void> setListAlamat({
    required String jalan,
    required String kelurahan,
    required String kota,
    required String kode,
  }) async {
    List<String> alamat = Storages.getListAlamat();
    alamat.add('$jalan, $kelurahan, $kota, $kode');
    await storages.setItem('alamat', alamat);
  }

  Future<void> logout() async {
    await storages.deleteItem('token');
    await storages.deleteItem('name');
    await storages.deleteItem('listAlamat');
    await storages.deleteItem('nightMode');
  }

  static String getToken() => storages.getItem('token') ?? '';
  static String getNoTelp() => storages.getItem('nomorTelepon') ?? '';
  static String getName() => storages.getItem('name') ?? '';
  static List<String> getListAlamat() => storages.getItem('listAlamat') ?? [];
  static String getAlamat() => storages.getItem('alamat') ?? '';
  static bool getNightMode() => storages.getItem('nightMode') ?? false;
}
