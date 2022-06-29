import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null || token == "null") return null;

    return token;
  }

  static setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token!);
  }
}
