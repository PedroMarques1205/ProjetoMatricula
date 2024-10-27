import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/login/client/login_client.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

@singleton
class LoginService {
  final LoginClient client = LoginClient();

  Future<UserDTO> doLogin(String code, String password) async {

    if (code.isEmpty || password.isEmpty) {
      throw Exception("Código e senha são obrigatórios.");
    }

    try {
      var user = await client.login(code, password);

      if (user != null && user.matricula != null && user.matricula!.isNotEmpty) {
        return user;
      } else {
        throw Exception("Usuário inválido."); 
      }
    } catch (error) {
      throw Exception("Erro ao realizar login: ${error.toString()}");
    }
  }
}