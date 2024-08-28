import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class RegisterSubjectsState {}

class RegisterSubjectsInitState extends RegisterSubjectsState {}

class SubjectListLoadedState extends RegisterSubjectsState {
  final List<SubjectDTO> subjects;

  SubjectListLoadedState({required this.subjects});
}