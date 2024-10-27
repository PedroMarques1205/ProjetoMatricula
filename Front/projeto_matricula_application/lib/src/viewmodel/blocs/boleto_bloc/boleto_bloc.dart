import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/user/user_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/boleto_bloc/boleto_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/boleto_bloc/boleto_state.dart';

class BoletoBloc extends Bloc<BoletoEvent, BoletoState> {
  final UserService service = UserService();

  BoletoBloc() : super (BoletoInitState()) {
    on<EmitirBoletoEvent>(_emitirBoleto);
  }

  Future<void> _emitirBoleto(EmitirBoletoEvent event, Emitter<BoletoState> emit) async {
    await service.emitirBoleto(event.matriculaAluno, event.valorBoleto);
    emit(BoletoEmitidoState());
  }
  
}