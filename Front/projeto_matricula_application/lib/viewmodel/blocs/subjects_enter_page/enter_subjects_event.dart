import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class EnterSubjectsEvent {}

class ListSubjectsEvent extends EnterSubjectsEvent {}

class CreateNewSubjectsEvent extends EnterSubjectsEvent {
  final SubjectDTO subject;

  CreateNewSubjectsEvent({required this.subject});
}