import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setData({required String key, required dynamic data}) async {
    if (data is bool) {
      return await prefs.setBool(key, data);
    } else if (data is String) {
      return await prefs.setString(key, data);
    } else if (data is int) {
      return await prefs.setInt(key, data);
    } else if (data is double) {
      return await prefs.setDouble(key, data);
    }
  }

  static dynamic getData({required String key}) {
    return prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await prefs.remove(key);
  }
}
