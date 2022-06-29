import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null || token == "null") return null;

    return token;
  }

//   static Future<bool?> getFormaDePagamento() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool? formaPagamento = prefs.getBool('formaPagamento');

//     if (formaPagamento == null) return null;

//     return formaPagamento;
//   }

//   static setFormaDePagamento(bool? formaPagamento) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('formaPagamento', formaPagamento!);
//   }

//   static setToken(String? token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('token', token as String);
//   }

//   static Future<Token?> getUserLoggedToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');

//     if (token == null || token == "null") return null;

//     return Token.fromJson(json.decode(token));
//   }

//   static setUserLoggedToken(Token? token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('token', json.encode(token));
//   }

//   static Future<UserModel?> getUserLogged() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userModel = prefs.getString('userModel');

//     if (userModel == null || userModel == "null") return null;

//     return UserModel.fromJson(json.decode(userModel));
//   }

//   static Future<String?> getIdClienteIugu() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? clienteIdIugu = prefs.getString('clienteIdIugu');

//     if (clienteIdIugu == null || clienteIdIugu == "null") return null;

//     return clienteIdIugu;
//   }

//   static setUserLogged(UserModel? userModel) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('userModel', json.encode(userModel));
//   }

//   static setClienteIdIugu(String? clienteIdIugu) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('clienteIdIugu', clienteIdIugu!);
//   }
}
