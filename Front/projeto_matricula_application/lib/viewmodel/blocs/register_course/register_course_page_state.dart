import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';

abstract class RegisterCoursePageState {}

class RegisterCoursePageInitState extends RegisterCoursePageState {}

class RegisterCoursePageStartState extends RegisterCoursePageState {}

class RegisterCoursesListLoaded extends RegisterCoursePageState {
  final List<CourseDTO> courses;

  RegisterCoursesListLoaded({required this.courses});
}

class NewCourseRegisteredState extends RegisterCoursePageState {
  final CourseDTO course;

  NewCourseRegisteredState({required this.course});
}

class NewCourseCreationErrorState extends RegisterCoursePageState {}