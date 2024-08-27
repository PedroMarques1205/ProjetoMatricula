import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/course/client/course_client.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';

@singleton
class CourseService {
  final CourseClient client = CourseClient();

  Future<List<CourseDTO>> listCourses() async {
    try {
      var courses = await client.listCourses();
      return courses;
    } catch (error) {
      return [];
    }
  }

  Future<CourseDTO?> createCourse(CourseDTO course) async {
    try {
      var createdCourse = await client.createCourse(course);
      return createdCourse;
    } catch (error) {
      return null;
    }
  }
}
