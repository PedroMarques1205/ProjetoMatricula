import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginClient {
  final String baseUrl;

  LoginClient(this.baseUrl);

  Future<bool> login(String code, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'code': code,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return true;
    } else {
      return false;
    }
  }
}
