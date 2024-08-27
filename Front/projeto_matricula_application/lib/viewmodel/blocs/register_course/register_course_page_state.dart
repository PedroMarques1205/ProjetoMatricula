import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

abstract class RegisterCoursePageState {}

class RegisterCoursePageInitState extends RegisterCoursePageState {}

class RegisterCoursePageStartState extends RegisterCoursePageState {}

class RegisterCoursesListLoaded extends RegisterCoursePageState {
  final List<UserDTO> courses;

  RegisterCoursesListLoaded({required this.courses});
}

class NewCourseRegisteredState extends RegisterCoursePageState {
  final UserDTO course;

  NewCourseRegisteredState({required this.course});
}

class NewCourseCreationErrorState extends RegisterCoursePageState {}