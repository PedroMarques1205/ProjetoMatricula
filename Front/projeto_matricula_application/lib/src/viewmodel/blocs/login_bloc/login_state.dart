import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginErrorState extends LoginState {}

class LoggedInState extends LoginState {
  final UserDTO user;

  LoggedInState({required this.user});
}

class LoginInProgressState extends LoginState {}