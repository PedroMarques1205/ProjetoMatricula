import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/init/init_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/init/init_state.dart';

class InitBloc extends Bloc<InitEvent, InitState> {
  InitBloc() : super (StartState()) {
    on<StartAppEvent>(_onStart);
  }

  Future<void> _onStart(StartAppEvent event, Emitter<InitState> emit) async {}
  
}