abstract class BoletoEvent {}

class EmitirBoletoEvent extends BoletoEvent {
  final String matriculaAluno;
  final double valorBoleto;

  EmitirBoletoEvent({required this.matriculaAluno, required this.valorBoleto});
}