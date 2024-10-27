import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/teacher/teacher_service.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import '../professor_page/professor_course_page_event.dart';
import '../professor_page/professor_course_page_state.dart';
import'../../../domain/teacher/teacher_service.dart';

class ProfessorPageBloc extends Bloc<ProfessorPageEvent, ProfessorPageState> {
  final TeacherService _service = TeacherService();

  ProfessorPageBloc() : super(ProfessorPageInitState()) {
    on<ProfessorPageGetDisciplinesEvent>(_onGetDisciplines);
  }

 Future<void> _onGetDisciplines(ProfessorPageGetDisciplinesEvent event, Emitter<ProfessorPageState> emit) async {
  emit(ProfessorPageLoading());
  try {
    var disciplines = await _service.getDisciplinesByProfessor(event.matriculaProfessor);
    emit(ProfessorDisciplinesLoaded(disciplines: disciplines));
  } catch (e) {
    emit(ProfessorDisciplinesError(message: e.toString()));
  }
}

}

