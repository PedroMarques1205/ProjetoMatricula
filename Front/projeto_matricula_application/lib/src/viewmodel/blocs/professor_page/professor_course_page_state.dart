import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class ProfessorPageState {}

class ProfessorPageInitState extends ProfessorPageState {}

class ProfessorPageStartState extends ProfessorPageState {}

class ProfessorPageLoading extends ProfessorPageState {}

class ProfessorDisciplinesLoaded extends ProfessorPageState {
  final List<SubjectDTO> disciplines;

  ProfessorDisciplinesLoaded({required this.disciplines});
}

class ProfessorDisciplinesError extends ProfessorPageState {
  final String message;

  ProfessorDisciplinesError({required this.message});
}
