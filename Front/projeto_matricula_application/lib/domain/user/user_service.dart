import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/boleto/dtos/boleto_dto.dart';
import 'package:projeto_matricula_application/domain/user/client/user_client.dart';

@singleton
class UserService {
  final UserClient userClient = UserClient();

  Future<UserDTO>? newStudent(UserDTO newUser, int courseId) async {
    try {
      return await userClient.registerStudentsCourse(newUser, courseId);
    } catch (error) {
      print(error);
      return UserDTO();
    }
  }

  Future<UserDTO>? newUser(UserDTO newUser) async {
    try {
      return await userClient.createUser(newUser);
    } catch (error) {
      print(error);
      return UserDTO();
    }
  }

  Future<BoletoDTO?> emitirBoleto(String matriculaAluno, double valor) async {
    try {
      return await userClient.gerarBoleto(matriculaAluno, valor);
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<List<dynamic>> listarBoletos(String matriculaAluno) async {
    try {
      return await userClient.getBoletoPorAluno(matriculaAluno);;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
