import 'dart:convert';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:http/http.dart' as http;

class TeacherClient {
  TeacherClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<List<UserDTO>> listProfessors() async {
    final url = Uri.parse('$baseUrl/usuario/obterUsuariosPorTipoAcesso?usuario=PROFESSOR');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        
        final List<UserDTO> professors = jsonList.map((json) => UserDTO.fromJson(json)).toList();

        return professors;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<SubjectDTO>> getDisciplinesByProfessor(String matriculaProfessor) async {
  final url = Uri.parse('$baseUrl/api/ProfessorDisciplina/obterDisciplinasPorProfessor?matriculaProfessor=$matriculaProfessor');
  
  try {
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<SubjectDTO> subjects = jsonList.map((json) => SubjectDTO.fromJson(json)).toList();
      return subjects;
    } else {
      throw Exception('Failed to load disciplines');
    }
  } catch (error) {
    throw Exception('Failed to load disciplines: $error');
  }
}



}
