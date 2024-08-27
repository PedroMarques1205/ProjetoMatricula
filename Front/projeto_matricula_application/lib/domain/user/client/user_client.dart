import 'dart:convert';

import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

import 'package:http/http.dart' as http;

class UserClient {
  UserClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<UserDTO> createUser(UserDTO newUser) async {
    final url = Uri.parse('$baseUrl/usuario/novoUsuario?usuario=${newUser.tipoAcesso}');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final dynamic user = jsonDecode(response.body);
        return UserDTO.fromJson(user);
      } else {
        return UserDTO();
      }
    } catch (error) {
      return UserDTO();
    }

  }
}