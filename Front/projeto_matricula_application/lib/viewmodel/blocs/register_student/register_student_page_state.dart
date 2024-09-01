import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

abstract class RegisterStudentPageState {}

class RegisterStudentPageInitState extends RegisterStudentPageState {}

class RegisterStudentPageStartState extends RegisterStudentPageState {}

class RegisterStudentsListLoaded extends RegisterStudentPageState {
  final List<UserDTO> students;
  final List<CourseDTO> courses;

  RegisterStudentsListLoaded({required this.students, required this.courses});
}

class NewStudentRegisteredState extends RegisterStudentPageState {
  final UserDTO user;

  NewStudentRegisteredState({required this.user});
}

class NewStudentCreationErrorState extends RegisterStudentPageState {}