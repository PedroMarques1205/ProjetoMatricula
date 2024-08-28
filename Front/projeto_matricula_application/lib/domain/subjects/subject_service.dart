import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/subjects/client/subject_client.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

@singleton
class SubjectService {
  final SubjectClient client = SubjectClient();

  Future<List<SubjectDTO>> listSubjects() async {
    try {
      return await client.listSubjects();
    } catch (error) {
      print(error);
      return [];
    }
  }
}