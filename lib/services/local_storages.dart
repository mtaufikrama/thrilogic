import 'package:localstorage/localstorage.dart';

class Storages {
  static LocalStorage storages = LocalStorage('thrilogic');

  Future<bool> ready() async {
    final ready = storages.ready;
    return ready;
  }

  Future<void> setToken({required String token}) async {
    await storages.deleteItem('token');
    await storages.setItem('token', token);
  }

  Future<void> setName({required String name}) async {
    await storages.deleteItem('name');
    await storages.setItem('name', name);
  }

  Future<void> setNoTelp({required String nomorTelepon}) async {
    await storages.deleteItem('nomorTelepon');
    await storages.setItem('nomorTelepon', nomorTelepon);
  }

  Future<void> setNightMode({required bool nightMode}) async {
    await storages.deleteItem('nightMode');
    await storages.setItem('nightMode', nightMode);
  }

  Future<void> setLengthCart({required int jumlah}) async {
    await storages.deleteItem('addCart');
    await storages.setItem('addCart', jumlah);
  }

  Future<void> setAddCart() async {
    int addProduk = Storages.getLengthCart() + 1;
    await storages.deleteItem('addCart');
    await storages.setItem('addCart', addProduk);
  }

  Future<void> setRemoveCart() async {
    int addProduk = Storages.getLengthCart() - 1;
    await storages.deleteItem('addCart');
    await storages.setItem('addCart', addProduk);
  }

  Future<void> setAlamat({required String alamat}) async {
    await storages.deleteItem('alamat');
    await storages.setItem('alamat', alamat);
  }

  Future<void> setEmail({required String email}) async {
    await storages.deleteItem('email');
    await storages.setItem('email', email);
  }

  Future<void> setIntroSlider() async {
    await storages.setItem('introSlider', true);
  }

  Future<void> setListAlamat({
    required String jalan,
    required String kelurahan,
    required String provinsi,
    required String detailLainnya,
  }) async {
    List<dynamic> alamat = Storages.getListAlamat();
    alamat.add(
        '$jalan \n$kelurahan, $provinsi${detailLainnya.isNotEmpty ? ", (Catatan : $detailLainnya)" : ''}');
    await storages.deleteItem('listAlamat');
    await storages.setItem('listAlamat', alamat);
  }

  Future<void> logout() async {
    await storages.deleteItem('token');
    await storages.deleteItem('name');
    await storages.deleteItem('nomorTelepon');
    await storages.deleteItem('listAlamat');
    await storages.deleteItem('alamat');
    await storages.deleteItem('email');
    await storages.deleteItem('nightMode');
  }

  static String getToken() => storages.getItem('token') ?? '';
  static String getNoTelp() => storages.getItem('nomorTelepon') ?? '';
  static String getName() => storages.getItem('name') ?? '';
  static String getEmail() => storages.getItem('email') ?? '';
  static List<dynamic> getListAlamat() => storages.getItem('listAlamat') ?? [];
  static String getAlamat() => storages.getItem('alamat') ?? '';
  static bool getNightMode() => storages.getItem('nightMode') ?? false;
  static int getLengthCart() => storages.getItem('addCart') ?? 0;
  static bool getIntroSlider() => storages.getItem('introSlider') ?? false;
}
