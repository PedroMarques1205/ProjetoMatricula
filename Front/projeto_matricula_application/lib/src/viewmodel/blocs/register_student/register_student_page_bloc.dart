import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/course/course_service.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/student/student_service.dart';
import 'package:projeto_matricula_application/domain/user/user_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_state.dart';

class RegisterStudentPageBloc
    extends Bloc<RegisterStudentPageEvent, RegisterStudentPageState> {
  final StudentService _service = StudentService();
  final UserService _userService = UserService();
  final CourseService _courseService = CourseService();

  RegisterStudentPageBloc() : super(RegisterStudentPageInitState()) {
    on<RegisterStudentPageStart>(_onStart);
    on<RegisterStudentPageGetInfoEvent>(_onGetInfo);
    on<RegisterNewStudentEvent>(_onNewStudent);
  }

  void _onStart(
      RegisterStudentPageStart event, Emitter<RegisterStudentPageState> emit) {
    emit(RegisterStudentPageStartState());
  }

  Future<void> _onGetInfo(RegisterStudentPageGetInfoEvent event,
      Emitter<RegisterStudentPageState> emit) async {
    var courses = await _courseService.listCourses();
    var students = await _service.listStudents();
    emit(RegisterStudentsListLoaded(students: students, courses: courses));
  }

  Future<void> _onNewStudent(RegisterNewStudentEvent event, Emitter<RegisterStudentPageState> emit) async {
    try {
      UserDTO newUser = UserDTO(
          nome: event.user.nome,
          matricula: event.user.matricula,
          senha: event.user.senha,
          tipoAcesso: event.user.tipoAcesso,
          ativo: true);

      var resp = await _userService.newStudent(newUser, event.course.id ?? 1);

      if (resp?.matricula != null && resp!.matricula!.isNotEmpty) {
        emit(NewStudentRegisteredState(user: resp));
      } else {
        emit(NewStudentCreationErrorState());
      }
    } catch (error) {
      print(error);
    }
  }
}
