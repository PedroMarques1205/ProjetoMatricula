import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

abstract class RegisterStudentPageState {}

class RegisterStudentPageInitState extends RegisterStudentPageState {}

class RegisterStudentPageStartState extends RegisterStudentPageState {}

class RegisterStudentsListLoaded extends RegisterStudentPageState {
  final List<UserDTO> students;

  RegisterStudentsListLoaded({required this.students});
}