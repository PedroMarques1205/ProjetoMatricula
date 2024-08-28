import 'dart:convert';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:http/http.dart' as http;

class CourseClient {
  CourseClient();

  final String baseUrl = BaseUrl.baseUrl;

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
        
        final List<CourseDTO> courses = jsonList.map((json) => CourseDTO.fromJson(json)).toList();

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
