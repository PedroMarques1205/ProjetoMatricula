import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

abstract class RegisterStudentPageEvent {}

class RegisterStudentPageStart extends RegisterStudentPageEvent {}

class RegisterStudentPageGetInfoEvent extends RegisterStudentPageEvent {}

class RegisterNewStudentEvent extends RegisterStudentPageEvent {
  final UserDTO user;
  final CourseDTO course;

  RegisterNewStudentEvent({required this.user, required this.course});
}