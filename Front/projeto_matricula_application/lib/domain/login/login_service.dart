import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/login/client/login_client.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

@singleton
class LoginService {

  final LoginClient client = LoginClient();

  Future<UserDTO> doLogin(String code, String password) async {
    try {
      var user = await client.login(code, password);
      return user ?? UserDTO();
    } catch (error) {
      return UserDTO();
    }
  }

}
