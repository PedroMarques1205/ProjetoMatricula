import 'dart:convert';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:http/http.dart' as http;

class StudentClient {
  StudentClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<List<UserDTO>> listStudents() async {
    final url = Uri.parse('${baseUrl}/usuario/obterUsuariosPorTipoAcesso?usuario=ALUNO');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        
        final List<UserDTO> students = jsonList.map((json) => UserDTO.fromJson(json)).toList();

        return students;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
