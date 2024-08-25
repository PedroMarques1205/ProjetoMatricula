import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/student/client/student_client.dart';

@singleton
class StudentService {
  StudentClient client = StudentClient();

  Future<List<UserDTO>> listStudents() async {
    return await client.listStudents();
  }
}