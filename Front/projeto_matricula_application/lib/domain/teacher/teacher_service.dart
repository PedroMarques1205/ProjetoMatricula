import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/teacher/client/teacher_client.dart';

@singleton
class TeacherService {
  TeacherClient client = TeacherClient();

  Future<List<UserDTO>> listProfessors() async {
    return await client.listProfessors();
  }
}
