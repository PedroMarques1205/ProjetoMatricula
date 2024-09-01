import 'dart:convert';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

class SubjectClient {
  SubjectClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<List<SubjectDTO>> listStudentsSubjects(String userId) async {
    final url = Uri.parse('$baseUrl/Disciplina/obterDisciplinasPorEstudante?matriculaEstudante=$userId');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<SubjectDTO> subjects = jsonList.map((json) => SubjectDTO.fromJson(json)).toList();

        return subjects;
      } else {
        return [];
      }
    } catch (error) {
      throw Exception('Failed to create subject: $error');
    }
  }

  Future<SubjectDTO> createSubject(SubjectDTO subject) async {
    final url = Uri.parse('$baseUrl/Disciplina/novaDisciplina');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(subject.toJson()),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return SubjectDTO.fromJson(json);
      } else {
        throw Exception('Failed to create subject');
      }
    } catch (error) {
      throw Exception('Failed to create subject: $error');
    }
  }

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
        final List<SubjectDTO> subjects =
            jsonList.map((json) => SubjectDTO.fromJson(json)).toList();

        return subjects;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<SubjectDTO>> associateSubject(String matricula, String subjectName) async {
  final url = Uri.parse('$baseUrl/matricula/matricularAlunoEmDisciplina?matriculaAluno=$matricula&nomeDisciplina=$subjectName');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<SubjectDTO> subjects =
          jsonList.map((json) => SubjectDTO.fromJson(json)).toList();

      return subjects;
    } else {
      return [];
    }
  } catch (error) {
    return [];
  }
}

Future<void> associateProfessor(String professorId, String subjectName) async {
  final url = Uri.parse('$baseUrl/ProfessorDisciplina/ligarProfessorEmDisciplina?matriculaAluno=$professorId&nomeDisciplina=$subjectName');

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'matriculaProfessor': professorId,
        'nomeDisciplina': subjectName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to associate professor with subject');
    }
  } catch (error) {
    throw Exception('Failed to associate professor with subject: $error');
  }
}



}
