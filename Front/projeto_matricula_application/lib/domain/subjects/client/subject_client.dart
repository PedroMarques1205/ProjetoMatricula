import 'dart:convert';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

class SubjectClient {
  SubjectClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<List<SubjectDTO>> listSubjects() async {
    final url = Uri.parse('$baseUrl/Disciplina/obterTodasAsDisciplinas');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        
        final List<SubjectDTO> subjects = jsonList.map((json) => SubjectDTO.fromJson(json)).toList();

        return subjects;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
