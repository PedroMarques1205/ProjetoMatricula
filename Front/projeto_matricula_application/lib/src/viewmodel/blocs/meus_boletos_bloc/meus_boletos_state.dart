import 'package:projeto_matricula_application/domain/boleto/dtos/boleto_dto.dart';

abstract class MeusBoletosState {}

class MeusBoletoInitState extends MeusBoletosState {}

class MeusBoletosLoadedState extends MeusBoletosState {
  final List<dynamic> boletos;

  MeusBoletosLoadedState({required this.boletos});
}