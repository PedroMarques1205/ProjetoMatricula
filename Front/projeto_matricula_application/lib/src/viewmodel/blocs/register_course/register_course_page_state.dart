import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class RegisterCoursePageState {}

class RegisterCoursePageInitState extends RegisterCoursePageState {}

class RegisterCoursePageStartState extends RegisterCoursePageState {}

class RegisterCoursesListLoaded extends RegisterCoursePageState {
  final List<CourseDTO> courses;
  final List<SubjectDTO> subjects;

  RegisterCoursesListLoaded({required this.courses, required this.subjects});
}

class NewCourseRegisteredState extends RegisterCoursePageState {
  final CourseDTO course;

  NewCourseRegisteredState({required this.course});
}

class NewCourseCreationErrorState extends RegisterCoursePageState {}