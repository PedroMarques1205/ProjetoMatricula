import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/course/client/course_client.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';

@singleton
class CourseService {
  final CourseClient client = CourseClient();

  Future<CourseDTO> getCourseById(String userId) async {
    try {
      return await client.courseByUserId(userId);
    } catch (e) {
      return CourseDTO();
    }
  }

  Future<List<CourseSubjectsDTO>> listCousesSubjects(int courseId) async {
    try {
      return await client.listCourseSubjects(courseId);
    } catch (error) {
      return [];
    }
  }

  Future<List<CourseDTO>> listCourses() async {
    try {
      return await client.listCourses();
    } catch (error) {
      return [];
    }
  }

  Future<CourseDTO?> createCourse(CourseDTO course) async {
    try {
      return await client.createCourse(course);
    } catch (error) {
      print('Error in service: $error');
      return null;
    }
  }
}
