import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/user/client/user_client.dart';

@singleton
class UserService {
  UserClient client = UserClient();

  Future<UserDTO>? newUser(UserDTO newUser) async {
    try {
      return await client.createUser(newUser);
    } catch (error) {
      print(error);
      return UserDTO();
    }
  }
}
