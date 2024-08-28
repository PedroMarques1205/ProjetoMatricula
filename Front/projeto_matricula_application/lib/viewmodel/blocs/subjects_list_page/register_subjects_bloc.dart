import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/subjects/subject_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_state.dart';

class RegisterSubjectsBloc extends Bloc<RegisterSubjectsEvent, RegisterSubjectsState> {
  final SubjectService service = SubjectService();

  RegisterSubjectsBloc() : super (RegisterSubjectsInitState()) {
    on<ListSubjectsEvent>(_onList);
  }

  Future<void> _onList(ListSubjectsEvent event, Emitter<RegisterSubjectsState> emit) async {
    var allSubjects = await service.listSubjects();

    emit(SubjectListLoadedState(subjects: allSubjects));
  }
}