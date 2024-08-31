import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class UserSubjectsState {}

class UserSubjectsInitState extends UserSubjectsState {}

class UserSubjectsLoadedState extends UserSubjectsState {
  final List<SubjectDTO> subjects;

  UserSubjectsLoadedState({required this.subjects});
}

class UserSubjectsEmptyState extends UserSubjectsState {}