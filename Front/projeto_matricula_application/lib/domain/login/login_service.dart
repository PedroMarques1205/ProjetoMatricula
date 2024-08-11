import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:projeto_matricula_application/domain/login/client/login_client.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

@singleton
class LoginService {

  final loginClient = LoginClient(BaseUrl.baseUrl);

  Future<UserDTO> doLogin(String code, String passwoard) async {
    // exemplo de chamada:
    // UserDTO user = await LoginClient.login(code, passwoard);
    // return user; 
    return UserDTO();
  }

}
