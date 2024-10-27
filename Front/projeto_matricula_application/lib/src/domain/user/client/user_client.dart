import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/boleto/dtos/boleto_dto.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

class UserClient {
  final String baseUrl = BaseUrl.baseUrl;

  UserClient();

  Future<UserDTO> registerStudentsCourse(UserDTO newUser, int idCurso) async {
    final url =
        Uri.parse('$baseUrl/usuario/salvarNovoAlunoEmUmCurso?idCurso=$idCurso');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser.toJson()),
      );

      if (response.statusCode == 200) {
        final dynamic user = jsonDecode(response.body);
        return UserDTO.fromJson(user);
      } else {
        return UserDTO();
      }
    } catch (error) {
      print(error);
      return UserDTO();
    }
  }

  Future<UserDTO> createUser(UserDTO newUser) async {
    final url = Uri.parse('$baseUrl/usuario/novoUsuario');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser.toJson()),
      );

      if (response.statusCode == 200) {
        final dynamic user = jsonDecode(response.body);
        return UserDTO.fromJson(user);
      } else {
        return UserDTO();
      }
    } catch (error) {
      print(error);
      return UserDTO();
    }
  }

  Future<BoletoDTO?> gerarBoleto(String matriculaAluno, double valor) async {
    final url = Uri.parse(
        '$baseUrl/Boleto/gerarBoleto?matriculaAluno=$matriculaAluno&valor=$valor');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final dynamic boleto = jsonDecode(response.body);
        return BoletoDTO.fromJson(boleto);
      } else {
        throw Exception(
            'Falha ao gerar boleto. Status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erro ao conectar com o servidor: $error');
    }
  }

  Future<List<dynamic>> getBoletoPorAluno(String matriculaAluno) async {
    final url = Uri.parse(
        '$baseUrl/Boleto/obterBoletoPorAluno?matriculaAluno=$matriculaAluno');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        return jsonResponse;
      } else {
        throw Exception('Falha ao carregar boletos');
      }
    } catch (error) {
      print(error);
      return [];
    }
  }
}
