import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

abstract class RegisterTeacherPageState {}

class RegisterTeacherPageInitState extends RegisterTeacherPageState {}

class RegisterTeacherPageStartState extends RegisterTeacherPageState {}

class RegisterTeachersListLoaded extends RegisterTeacherPageState {
  final List<UserDTO> teachers;

  RegisterTeachersListLoaded({required this.teachers});
}
