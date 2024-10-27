import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/user/user_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/meus_boletos_bloc/meus_boletos_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/meus_boletos_bloc/meus_boletos_state.dart';

class MeusBoletosBloc extends Bloc<MeusBoletosEvent, MeusBoletosState> {
  final UserService service = UserService();

  MeusBoletosBloc() : super(MeusBoletoInitState()) {
    on<ListMeusBoletosEvent>(_list);
  }

  Future<void> _list(ListMeusBoletosEvent event, Emitter<MeusBoletosState> emit) async {
    var items = await service.listarBoletos(Context.current.matricula!);
    print(items);
    emit(MeusBoletosLoadedState(boletos: items));
  }
  
}