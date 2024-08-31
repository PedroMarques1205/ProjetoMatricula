
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';

abstract class CourseGradeState {}

class CourseGradeInitState extends CourseGradeState {}

class CourseGradeLoadedState extends CourseGradeState {
  final List<CourseSubjectsDTO> subjects;
  final CourseDTO course;

  CourseGradeLoadedState({required this.subjects, required this.course});
}

class LoadCourseErrorState extends CourseGradeState {}