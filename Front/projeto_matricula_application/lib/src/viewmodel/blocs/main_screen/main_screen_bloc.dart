import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitState()) {
    on<MainScreenStartEvent>(_onStart);
  }

  void _onStart(MainScreenStartEvent event, Emitter<MainScreenState> emit) {}
  
}