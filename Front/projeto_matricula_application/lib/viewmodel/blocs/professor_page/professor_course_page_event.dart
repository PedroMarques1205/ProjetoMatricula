abstract class ProfessorPageEvent {}

class ProfessorPageStart extends ProfessorPageEvent {}

class ProfessorPageGetDisciplinesEvent extends ProfessorPageEvent {
  final String matriculaProfessor;

  ProfessorPageGetDisciplinesEvent({required this.matriculaProfessor});
}

