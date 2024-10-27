import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/domain/login/login_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService service = LoginService();

  LoginBloc() : super (LoginInitState()) {
    on<LoginStartEvent>(onStart);
    on<LoginButtonPressed>(onLoginPressed);
  }

  void onStart(LoginStartEvent event, Emitter<LoginState> emit) {}

  Future<void> onLoginPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      UserDTO user = await service.doLogin(event.code, event.passwoard);

      if (user.matricula != null && user.matricula!.isNotEmpty) {
        emit(LoggedInState(user: user)); 
      } else {
        emit(LoginErrorState(message: "Matrícula inválida.")); 
      }
    } catch (error) {
      emit(LoginErrorState(message: error.toString()));
    }
  }
}