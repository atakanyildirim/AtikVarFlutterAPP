import 'package:http/http.dart' as http;

class Http {
  static Future<http.Response> post(String url, var payload) async {
      return await http.post(url, body: payload).timeout(Duration(seconds: 3));
  }

  static Future<http.Response> get(String url) {
    return http.get(url).timeout(Duration(seconds: 4));
  }
}
