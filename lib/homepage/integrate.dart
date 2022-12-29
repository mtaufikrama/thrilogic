// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:thrilogic_shop/API/json_future/json_future.dart';
import 'package:thrilogic_shop/API/object_class/category.dart';
import 'package:thrilogic_shop/API/object_class/keranjang.dart';
import 'package:thrilogic_shop/homepage/homepage.dart';
import 'package:thrilogic_shop/pages/roni/Splashscreen.dart';
import 'package:thrilogic_shop/pages/yozi/login_page.dart';
import 'package:thrilogic_shop/services/local_storages.dart';
import 'package:thrilogic_shop/services/styles.dart';
import 'package:wave_transition/wave_transition.dart';

class IntegrateAPI extends StatefulWidget {
  const IntegrateAPI({super.key});

  @override
  State<IntegrateAPI> createState() => _IntegrateAPIState();
}

class _IntegrateAPIState extends State<IntegrateAPI> {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic>? deviceData;

  List<DataGetKategoriById> listDataKategori = [];
  List<ProductsGetKategoriById> listProducts = [];
  Future<void>? addcart;
  int time = 0;
  Timer? times;
  String datadevice = '';
  // GetBarang? cekmessage;

  @override
  void dispose() {
    times!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    initPlatformState();
    times = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        time = timer.tick;
        print(time);
        if (time == 15) {
          timer.cancel();
          setState(() {});
        }
      },
    );
    super.initState();
  }

  void initPlatformState() async {
    await Storages().setCounterApp();
    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          deviceData =
              _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error': 'Failed to get platform version.'
      };
    }

    MapEntry<String, dynamic> mapEntry;
    deviceData!.map((key, value) {
      mapEntry = MapEntry(key, value);
      datadevice += "${mapEntry.key} = ${mapEntry.value}\n";
      return mapEntry;
    });
    print(datadevice);
    teleThrilo(
        "User sudah membuka Aplikasi sebanyak ${Storages.getCounterApp()} kali\n\n${kIsWeb ? 'Web Browser info' : Platform.isAndroid ? 'Android Device Info' : Platform.isIOS ? 'iOS Device Info' : Platform.isLinux ? 'Linux Device Info' : Platform.isMacOS ? 'MacOS Device Info' : Platform.isWindows ? 'Windows Device Info' : ''}\n\n$datadevice");
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    };
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    return Scaffold(
      backgroundColor: Warna().terang,
      body: FutureBuilder<GetKeranjang>(
        future: JsonFuture().getKeranjang(),
        builder: (context, snapshotGetKeranjang) {
          if (snapshotGetKeranjang.hasData &&
              snapshotGetKeranjang.connectionState != ConnectionState.waiting &&
              snapshotGetKeranjang.data != null &&
              snapshotGetKeranjang.data!.data != null) {
            if (listDataKategori.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: listkategori.map((e) {
                  return FutureBuilder<GetKategoriById>(
                    future: JsonFuture().getKategoriById(id: e['id']),
                    builder: (context, snapshotGetKategoriById) {
                      if (snapshotGetKategoriById.hasData &&
                          snapshotGetKategoriById.connectionState !=
                              ConnectionState.waiting &&
                          snapshotGetKategoriById.data != null &&
                          snapshotGetKategoriById.data!.data != null) {
                        listDataKategori
                            .add(snapshotGetKategoriById.data!.data!);
                        listProducts.addAll(
                            snapshotGetKategoriById.data!.data!.products!);
                        if (listDataKategori.length == listkategori.length) {
                          listProducts.shuffle();
                          times!.cancel();
                          return GestureDetector(
                            onTap: () async {
                              cart.cart =
                                  snapshotGetKeranjang.data!.data!.length;
                              Navigator.pushReplacement(
                                context,
                                WaveTransition(
                                  duration: const Duration(milliseconds: 1000),
                                  child: HomePage(
                                    listProducts: listProducts,
                                    listDataKategori: listDataKategori,
                                    getkeranjang: snapshotGetKeranjang.data!,
                                    selectedIndex: 0,
                                  ),
                                  center: const FractionalOffset(0.5, 0.5),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Warna().first,
                              child: Center(
                                child: Text(
                                  'TAP SCREEN',
                                  style: Font.style(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    },
                  );
                }).toList(),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const IntegrateAPI(),
                    ),
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Warna().first,
                  child: Center(
                    child: Text(
                      'DATA GAGAL DI PROSES',
                      style: Font.style(color: Colors.white),
                    ),
                  ),
                ),
              );
            }
          } else {
            if (time >= 15) {
              times!.cancel();
              return Center(
                child: AlertDialog(
                  backgroundColor: Warna().primerCard,
                  content: Text(
                    'Data Gagal diproses',
                    style: Font.style(),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    IconButton(
                      tooltip: 'Instal Ulang Aplikasi',
                      onPressed: () async {
                        times!.cancel();
                        await JsonFuture().logout();
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: const SplashScreen(),
                            center: const FractionalOffset(0.5, 0.5),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.install_mobile_rounded,
                        color: Warna().icon,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Login Kembali',
                      onPressed: () async {
                        times!.cancel();
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: const LoginScreen(),
                            center: const FractionalOffset(0.5, 0.5),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.login_rounded,
                        color: Warna().icon,
                      ),
                    ),
                    IconButton(
                      tooltip: 'Restart Aplikasi',
                      onPressed: () async {
                        times!.cancel();
                        Navigator.pushReplacement(
                          context,
                          WaveTransition(
                            duration: const Duration(milliseconds: 700),
                            child: const IntegrateAPI(),
                            center: const FractionalOffset(0.5, 0.5),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.restart_alt_rounded,
                        color: Warna().icon,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Stack(
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  if (time == 10)
                    Center(
                      child: Text('Loading is a taking too long'),
                    )
                ],
              );
            }
          }
        },
      ),
    );
  }
}
