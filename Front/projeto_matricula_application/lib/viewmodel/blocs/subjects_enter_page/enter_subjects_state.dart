import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class EnterSubjectsState {}

class EnterSubjectsInitState extends EnterSubjectsState {}

class SubjectListLoadedState extends EnterSubjectsState {
  final List<SubjectDTO> subjects;

  SubjectListLoadedState({required this.subjects});
}