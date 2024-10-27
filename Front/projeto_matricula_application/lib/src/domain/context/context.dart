import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

class Context {
  static UserDTO currentUser = UserDTO();
  static UserDTO get current => currentUser;
}