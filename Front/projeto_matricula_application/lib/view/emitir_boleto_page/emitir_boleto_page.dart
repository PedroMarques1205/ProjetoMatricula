import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/boleto_bloc/boleto_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/boleto_bloc/boleto_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/boleto_bloc/boleto_state.dart';

class EmitirBoletoPage extends StatefulWidget {
  @override
  _EmitirBoletoPageState createState() => _EmitirBoletoPageState();
}

class _EmitirBoletoPageState extends State<EmitirBoletoPage> {
  final _formKey = GlobalKey<FormState>();
  String _matricula = '';
  String _valor = '';
  BoletoBloc _bloc = BoletoBloc();

  @override
  void initState() {
    super.initState();
  }

  void _emitirBoleto() {
    if (_formKey.currentState!.validate()) {
      final matricula = _matricula;
      final valor = double.tryParse(_valor);

      _bloc.add(EmitirBoletoEvent(
          matriculaAluno: matricula, valorBoleto: valor ?? 0.0));

      if (valor != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Boleto emitido para matrícula $matricula no valor de R\$ ${valor.toStringAsFixed(2)}')),
        );

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Valor inválido.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Emitir Boleto',
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: ProjectColors.primaryColor,),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (route) => false,
              );
            },
          ),
        ),
        body: BlocConsumer<BoletoBloc, BoletoState>(
          bloc: _bloc,
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputWidget(
                      title: 'Matrícula',
                      hintText: 'Digite a matrícula do aluno',
                      onChanged: (value) {
                        _matricula = value;
                      },
                    ),
                    SizedBox(height: 16),
                    InputWidget(
                      title: 'Valor do Boleto',
                      hintText: 'Digite o valor do boleto',
                      onChanged: (value) {
                        _valor = value;
                      },
                    ),
                    SizedBox(height: 450),
                    ButtonWidget(
                      text: 'Emitir',
                      onPressed: _emitirBoleto,
                      width: 300,
                      backgroundColor: ProjectColors.primaryColor,
                      centerTitle: true,
                      textColor: Colors.white,
                      radius: 20,
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
