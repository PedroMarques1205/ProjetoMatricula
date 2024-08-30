import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class EnterSubjectsEvent {}

class EnterSubjectsPageStart extends EnterSubjectsEvent {
}

class ListSubjectsEvent extends EnterSubjectsEvent {}

class CreateNewSubjectsEvent extends EnterSubjectsEvent {
  final SubjectDTO subject;

  CreateNewSubjectsEvent({required this.subject});
}

class AssociateSubjectEvent extends EnterSubjectsEvent {
  final SubjectDTO subject;
  final String matricula;

  AssociateSubjectEvent({
    required this.subject,
    required this.matricula,
  });
}
