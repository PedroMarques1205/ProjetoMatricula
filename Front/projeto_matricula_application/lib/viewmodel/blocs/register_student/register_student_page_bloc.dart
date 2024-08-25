import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/student/student_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_state.dart';

class RegisterStudentPageBloc extends Bloc<RegisterStudentPageEvent, RegisterStudentPageState> {

  final StudentService _service = StudentService();

  RegisterStudentPageBloc() : super(RegisterStudentPageInitState()) {
    on<RegisterStudentPageStart>(_onStart);
    on<RegisterStudentPageGetInfoEvent>(_onGetInfo);
  }

  void _onStart(RegisterStudentPageStart event, Emitter<RegisterStudentPageState> emit) {
    emit(RegisterStudentPageStartState());
  }

  Future<void> _onGetInfo(RegisterStudentPageGetInfoEvent event, Emitter<RegisterStudentPageState> emit) async {
    var students = await _service.listStudents();
    emit(RegisterStudentsListLoaded(students: students));
  }
  
}