import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

abstract class RegisterTeacherPageState {}

class RegisterTeacherPageInitState extends RegisterTeacherPageState {}

class RegisterTeacherPageStartState extends RegisterTeacherPageState {}

class RegisterTeachersListLoaded extends RegisterTeacherPageState {
  final List<UserDTO> teachers;

  RegisterTeachersListLoaded({required this.teachers});
}

class NewTeacherRegisteredState extends RegisterTeacherPageState {
  final UserDTO user;

  NewTeacherRegisteredState({required this.user});
}

class NewStudentCreationErrorState extends RegisterTeacherPageState {}


class TeacherDisciplinesLoaded extends RegisterTeacherPageState {
  final List<SubjectDTO> disciplines;

  TeacherDisciplinesLoaded({required this.disciplines});
}

class TeacherDisciplinesError extends RegisterTeacherPageState {
  final String message;

  TeacherDisciplinesError({required this.message});
}