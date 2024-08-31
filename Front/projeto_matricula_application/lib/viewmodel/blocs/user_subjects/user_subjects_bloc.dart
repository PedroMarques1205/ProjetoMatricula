import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/user_subjects/user_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/user_subjects/user_subjects_state.dart';

class UserSubjectsBloc extends Bloc<UserSubjectsEvent, UserSubjectsState> {
  UserSubjectsBloc() : super(UserSubjectsInitState()) {
    on<UserSubjectsStartEvent>(_onStart);
  }

  Future<void> _onStart(UserSubjectsStartEvent event, Emitter<UserSubjectsState> emit) async {}
  
}