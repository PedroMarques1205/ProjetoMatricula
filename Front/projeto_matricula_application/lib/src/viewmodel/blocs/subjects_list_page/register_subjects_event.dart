import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class RegisterSubjectsEvent {}

class ListSubjectsEvent extends RegisterSubjectsEvent {}

class CreateNewSubjectsEvent extends RegisterSubjectsEvent {
  final SubjectDTO subject;

  CreateNewSubjectsEvent({required this.subject});
}