import 'package:grpcmobil/model/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController {
  static Future<bool> isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogged = prefs.getBool('isLogged');
    return isLogged;
  }

  static Future<String> getLoggedUserInformation(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loggedUserInformation = prefs.getString(key);
    return loggedUserInformation;
  }

  static Future<bool> attempt(String username, String password) async {
    http.Response response = await Http.post("http://10.0.2.2:3003/login",
        {'kullaniciAdi': username, 'sifre': password});
    var jsonBody = jsonDecode(response.body);
    if (jsonBody['durumKodu'] == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true);
      await prefs.setString('userName', jsonBody["kurumAdi"]);
      await prefs.setString('userId', jsonBody["userId"].toString());
      return true;
    } else
      return false;
  }

  static logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
