import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/subjects/subject_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_enter_page/enter_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_enter_page/enter_subjects_state.dart';

class EnterSubjectsBloc extends Bloc<EnterSubjectsEvent, EnterSubjectsState> {
  final SubjectService service = SubjectService();

  EnterSubjectsBloc() : super(EnterSubjectsInitState()) {
    on<ListSubjectsEvent>(_onList);
    on<CreateNewSubjectsEvent>(_onCreate);
    on<AssociateSubjectEvent>(_onAssociate);  
  }

  Future<void> _onCreate(CreateNewSubjectsEvent event, Emitter<EnterSubjectsState> emit) async {
    await service.createSubject(event.subject);
  }

  Future<void> _onList(ListSubjectsEvent event, Emitter<EnterSubjectsState> emit) async {
    var allSubjects = await service.listSubjects();
    emit(SubjectListLoadedState(subjects: allSubjects));
  }

  Future<void> _onAssociate(AssociateSubjectEvent event, Emitter<EnterSubjectsState> emit) async {
    await service.associateSubject(event.subject);
  }
}

