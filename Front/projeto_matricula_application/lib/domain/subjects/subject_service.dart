import 'package:injectable/injectable.dart';
import 'package:projeto_matricula_application/domain/subjects/client/subject_client.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

@singleton
class SubjectService {
  final SubjectClient client = SubjectClient();

  Future<List<SubjectDTO>> listStudentsSubjects(String userId) async {
    try {
      return await client.listStudentsSubjects(userId);
    } catch (error) {
      return [];
    }
  }

  Future<List<SubjectDTO>> listSubjects() async {
    try {
      return await client.listSubjects();
    } catch (error) {
      print(error);
      return [];
    }
  }

  Future<SubjectDTO> createSubject(SubjectDTO subject) async {
    try {
      return await client.createSubject(subject);
    } catch (error) {
      print(error);
      return SubjectDTO();
    }
  }

Future<SubjectDTO> associateSubject(String matricula, String subjectName) async {
  try {
    List<SubjectDTO> result = await client.associateSubject(matricula, subjectName);
    return result.isNotEmpty ? result.first : SubjectDTO();
  } catch (error) {
    print(error);
    return SubjectDTO();
  }
}
  
  Future<void> associateProfessor(String professorId, String subjectName) async {
  try {
    await client.associateProfessor(professorId, subjectName);
  } catch (error) {
    print(error);
  }
}


}
