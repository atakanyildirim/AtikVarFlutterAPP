import 'dart:convert';

import 'package:grpcmobil/model/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WasteController {
  static Future<List> getAllWastes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId');
    http.Response response =
        await Http.get("http://10.0.2.2:3003/waste?kullaniciId=" + userId);
    var jsonResponse = jsonDecode(response.body);
    List body = jsonResponse['rows'];
    return body;
  }

  static Future<bool> addWaste(
      String atikTur, int atikMiktar, String miktarTur) async {
    int atikTuru;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId');
    switch (atikTur) {
      case "Atık Pil":
        {
          atikTuru = 1;
          break;
        }
      case "Kağıt Atık":
        {
          atikTuru = 2;
          break;
        }
      case "Plastik Atık":
        {
          atikTuru = 3;
          break;
        }
      case "Cam Atık":
        {
          atikTuru = 4;
          break;
        }
    }

    http.Response response = await Http.post("http://10.0.2.2:3003/waste", {
      'kullaniciId': userId,
      'atikTuru': atikTuru.toString(),
      'miktar': atikMiktar.toString(),
      'miktarTip': miktarTur
    });
    var jsonBody = jsonDecode(response.body);
    if(jsonBody['durumKodu']==201)
      return true;
    else
      return false;
  }
}
