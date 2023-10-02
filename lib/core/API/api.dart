import 'package:http/http.dart' as http;

abstract class APIManager {
  static Future<http.Response> getMethod({
    required String baseUrl,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response =
        await http.get(Uri.parse(baseUrl), headers: headers);
    if (response.statusCode == 200) {
      return response;
    }
    return throw Exception("Error Failed in Network");
  }

  static Future<http.Response> postMethod(
      {required String baseUrl,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      body: body,
      headers: headers,
    );
    return response;
  }
}
