import 'package:device_info_plus/device_info_plus.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

abstract class KeyGenerator {
  static generate() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String rawKey =
        "${androidInfo.device}${DateTime.now().millisecondsSinceEpoch}";
    var bytes = utf8.encode(rawKey);
    var hashed = sha256.convert(bytes).toString();
    var sKey = hashed.substring(0, 16);
    return '${sKey.substring(0, 4)}-${sKey.substring(4, 8)}-'
            '${sKey.substring(8, 12)}-${sKey.substring(12, 16)}'
        .toLowerCase();
  }
}
