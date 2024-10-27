import 'dart:convert';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_with_subjects_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/students_course_registration.dart';

class CourseClient {
  CourseClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<List<CourseSubjectsDTO>?> createCourseWithSubject(CourseDTO course, List<SubjectsSemester> subjects) async {
    final url = Uri.parse('$baseUrl/curso/novoCursoComDisciplinas');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'curso': course.toJson(),
          'disciplinaComSemestre':
              subjects.map((subject) => subject.toJson()).toList(),
        }),
      );

      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        List<CourseSubjectsDTO> courseSubjects = (jsonResponse as List)
            .map((json) => CourseSubjectsDTO.fromJson(json))
            .toList();
        return courseSubjects;
      } else {
        print('Failed to create course: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error creating course: $error');
      return null;
    }
  }

  Future<StudentsCourseRegistration> registerStudentOnCourse(String userId, String courseId) async {
    final url = Uri.parse('$baseUrl/alunosPorCurso/matricularAlunoEmUmCurso?matriculaAluno=$userId,nomeCurso=$courseId');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final dynamic courseJson = jsonDecode(response.body);

        final StudentsCourseRegistration course =
            StudentsCourseRegistration.fromJson(courseJson);

        return course;
      } else {
        return StudentsCourseRegistration();
      }
    } catch (error) {
      return StudentsCourseRegistration();
    }
  }

  Future<CourseDTO> courseByUserId(String userId) async {
    final url = Uri.parse('$baseUrl/alunosPorCurso/obterCursoPorAluno?matriculaAluno=$userId');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final dynamic courseJson = jsonDecode(response.body);

        final CourseDTO course = CourseDTO.fromJson(courseJson);

        return course;
      } else {
        return CourseDTO();
      }
    } catch (error) {
      return CourseDTO();
    }
  }

  Future<List<CourseSubjectsDTO>> listCourseSubjects(int courseId) async {
    final url = Uri.parse('$baseUrl/disciplinascurso/gerarCurriculoDoCurso?idCurso=$courseId');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> courseJson = jsonDecode(response.body);

        final List<CourseSubjectsDTO> courseSubjects =
            courseJson.map((json) => CourseSubjectsDTO.fromJson(json)).toList();

        return courseSubjects;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<CourseDTO>> listCourses() async {
    final url = Uri.parse('$baseUrl/curso/obterTodosOsCursos');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        final List<CourseDTO> courses =
            jsonList.map((json) => CourseDTO.fromJson(json)).toList();

        return courses;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  Future<CourseDTO?> createCourse(CourseDTO course) async {
    final url = Uri.parse('$baseUrl/curso/novoCurso');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(course.toJson()),
      );

      if (response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        return CourseDTO.fromJson(jsonResponse);
      } else {
        print('Failed to create course: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error creating course: $error');
      return null;
    }
  }
}
