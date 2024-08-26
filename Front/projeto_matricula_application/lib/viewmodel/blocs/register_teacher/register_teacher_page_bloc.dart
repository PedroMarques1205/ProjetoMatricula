import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/teacher/teacher_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_state.dart';

class RegisterTeacherPageBloc extends Bloc<RegisterTeacherPageEvent, RegisterTeacherPageState> {

  final TeacherService _service = TeacherService();

  RegisterTeacherPageBloc() : super(RegisterTeacherPageInitState()) {
    on<RegisterTeacherPageStart>(_onStart);
    on<RegisterTeacherPageGetInfoEvent>(_onGetInfo);
  }

  void _onStart(RegisterTeacherPageStart event, Emitter<RegisterTeacherPageState> emit) {
    emit(RegisterTeacherPageStartState());
  }

  Future<void> _onGetInfo(RegisterTeacherPageGetInfoEvent event, Emitter<RegisterTeacherPageState> emit) async {
    var teachers = await _service.listProfessors();
    emit(RegisterTeachersListLoaded(teachers: teachers));
  }
}
