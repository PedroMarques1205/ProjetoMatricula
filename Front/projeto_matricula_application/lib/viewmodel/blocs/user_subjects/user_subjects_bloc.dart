import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/subjects/subject_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/user_subjects/user_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/user_subjects/user_subjects_state.dart';

class UserSubjectsBloc extends Bloc<UserSubjectsEvent, UserSubjectsState> {
  final SubjectService service = SubjectService();
  
  UserSubjectsBloc() : super(UserSubjectsInitState()) {
    on<UserSubjectsStartEvent>(_onStart);
  }

  Future<void> _onStart(UserSubjectsStartEvent event, Emitter<UserSubjectsState> emit) async {
    var subjects = await service.listStudentsSubjects(Context.current.matricula!);

    if (subjects.isNotEmpty){
      emit(UserSubjectsLoadedState(subjects: subjects));
    } else {
      emit(UserSubjectsEmptyState());
    }
  }
  
}