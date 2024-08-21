import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
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
    try {
      UserDTO user = await service.doLogin(event.code, event.passwoard);
      if (user.matricula != null && user.matricula!.isNotEmpty) {
        Context.currentUser = user;
        emit(LoggedInState(user: user));
      }
    } catch (error) {
      emit(LoginErrorState());
    }
  }
  
}