import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/boleto/dtos/boleto_dto.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/meus_boletos_bloc/meus_boletos_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/meus_boletos_bloc/meus_boletos_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/meus_boletos_bloc/meus_boletos_state.dart';

class PagamentoAlert extends StatefulWidget {
  @override
  _PagamentoAlertState createState() => _PagamentoAlertState();
}

class _PagamentoAlertState extends State<PagamentoAlert> {
  MeusBoletosBloc _bloc = MeusBoletosBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(ListMeusBoletosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[600],
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Emissão do Boleto Bancário',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ProjectColors.primaryLight),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
          },
        ),
      ),
      body: BlocConsumer<MeusBoletosBloc, MeusBoletosState>(
        bloc: _bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MeusBoletosLoadedState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.boletos.length,
                itemBuilder: (context, index) {
                  var boleto = BoletoDTO(
                    alunoDevedor: Context.current,
                    dataValidade: DateTime.now(),
                    valor: 1500.0,
                    pago: false,
                    id: 8,
                  );
                  DateTime dueDate = boleto.dataValidade ?? DateTime.now();
                  return Card(
                    color: ProjectColors.buttonColor,
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        leading: Icon(Icons.file_copy, color: Colors.grey[800]),
                        title: Text(
                          '${boleto.dataValidade?.month}/${boleto.dataValidade?.year}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        trailing: Icon(
                          Icons.print,
                          color: Colors.blue,
                        ),
                        children: [
                          ListTile(
                            title: const Text(
                              'Imprimir boleto',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              print('Imprimir boleto ${boleto.id}');
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Vencimento: ${dueDate.toLocal().toString().split(' ')[0]}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Pagador: ${boleto.alunoDevedor?.nome ?? 'Desconhecido'}',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ProjectColors.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
