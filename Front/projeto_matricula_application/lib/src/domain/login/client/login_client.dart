import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

class LoginClient {
  LoginClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<UserDTO?> login(String code, String password) async {
    final url = Uri.parse('$baseUrl/usuario/login?usuario=$code&senha=$password');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 101) {
        print(response);
      }
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return UserDTO.fromJson(data);
      } else {
        return UserDTO();
      }
    } catch (error) {
      print(error);
    }
  }
}
