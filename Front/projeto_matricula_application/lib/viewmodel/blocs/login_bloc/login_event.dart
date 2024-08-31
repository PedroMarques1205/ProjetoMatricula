abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String code;
  final String passwoard;

  LoginButtonPressed({required this.code, required this.passwoard,});
}

class LoginStartEvent extends LoginEvent {}