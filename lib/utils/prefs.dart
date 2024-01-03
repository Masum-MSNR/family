import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static remove(String key) {
    _prefs.remove(key);
  }

  static clear() async {
    await _prefs.clear();
  }

  static set isFirstTime(bool value) => _prefs.setBool('isFirstTime', value);

  static bool get isFirstTime => _prefs.getBool('isFirstTime') ?? true;

  static set isMale(bool value) => _prefs.setBool('isMale', value);

  static bool get isMale => _prefs.getBool('isMale') ?? true;
}
