import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/student/student_service.dart';
import 'package:projeto_matricula_application/domain/user/user_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_state.dart';

class RegisterStudentPageBloc extends Bloc<RegisterStudentPageEvent, RegisterStudentPageState> {

  final StudentService _service = StudentService();
  final UserService _userService = UserService();

  RegisterStudentPageBloc() : super(RegisterStudentPageInitState()) {
    on<RegisterStudentPageStart>(_onStart);
    on<RegisterStudentPageGetInfoEvent>(_onGetInfo);
    on<RegisterNewStudentEvent>(_onNewStudent);
  }

  void _onStart(RegisterStudentPageStart event, Emitter<RegisterStudentPageState> emit) {
    emit(RegisterStudentPageStartState());
  }

  Future<void> _onGetInfo(RegisterStudentPageGetInfoEvent event, Emitter<RegisterStudentPageState> emit) async {
    var students = await _service.listStudents();
    emit(RegisterStudentsListLoaded(students: students));
  }

  Future<void> _onNewStudent(RegisterNewStudentEvent event, Emitter<RegisterStudentPageState> emit) async {
    UserDTO newUser = UserDTO(
      nome: event.user.nome,
      matricula: event.user.matricula,
      senha: event.user.senha,
      tipoAcesso: event.user.tipoAcesso,
      ativo: true
    );

    var resp = await _userService.newUser(newUser);
    
    if (resp?.matricula != null && resp!.matricula!.isNotEmpty) {
      emit(NewStudentRegisteredState(user: resp));
    } else {
      emit(NewStudentCreationErrorState());
    }
  }
  
}