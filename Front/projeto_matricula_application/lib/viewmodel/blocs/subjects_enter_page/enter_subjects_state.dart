import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class EnterSubjectsState {}

class EnterSubjectsInitState extends EnterSubjectsState {}

class SubjectListLoadedState extends EnterSubjectsState {
  final List<SubjectDTO> subjects;
  final List<CourseSubjectsDTO> otherSubjects;
  final List<SubjectDTO> mySubjects;
  final CourseDTO course;

  SubjectListLoadedState({
    required this.subjects,
    required this.otherSubjects,
    required this.mySubjects,
    required this.course,
  });
}

class SubjectListLoadingErrorState extends EnterSubjectsState {}

class AssociationSuccessState extends EnterSubjectsState {}

class AssociationErrorState extends EnterSubjectsState {
  final String message;

  AssociationErrorState({required this.message});
}

class EnterSubjectsWithProfessorIdState extends EnterSubjectsState {
  final String professorId;

  EnterSubjectsWithProfessorIdState({required this.professorId});
}

class ReloadingRegisterPageState extends EnterSubjectsState {} 


