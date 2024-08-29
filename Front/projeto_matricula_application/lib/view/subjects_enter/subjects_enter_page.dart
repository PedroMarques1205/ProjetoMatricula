import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_enter_page/enter_subjects_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_enter_page/enter_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_enter_page/enter_subjects_state.dart';

class SubjectsEnterPage extends StatefulWidget {
  @override
  _SubjectsEnterPageState createState() => _SubjectsEnterPageState();
}

class _SubjectsEnterPageState extends State<SubjectsEnterPage> {
  late final EnterSubjectsBloc _bloc;
  List<SubjectDTO> allSubjects = [];

  @override
  void initState() {
    super.initState();
    _bloc = EnterSubjectsBloc();
    _bloc.add(ListSubjectsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Disciplinas',
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ProjectColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
          },
        ),
      ),
      body: BlocBuilder<EnterSubjectsBloc, EnterSubjectsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is SubjectListLoadedState) {
            allSubjects = state.subjects;

            return ListView.builder(
              itemCount: allSubjects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: generateRandomGradientColors(),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(
                            allSubjects[index].nome ?? 'Nome não disponível',
                            style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => registerStudent(allSubjects[index]),
                          child: const Text('Se Inscrever'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(
              color: ProjectColors.primaryColor,
            ),
          );
        },
      ),
    );
  }

  List<Color> generateRandomGradientColors() {
    final random = Random();

    Color getRandomColor() {
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    return [
      getRandomColor(),
      getRandomColor(),
    ];
  }

 void registerStudent(SubjectDTO subject) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Cadastrar Aluno'),
      content: Text('Você deseja cadastrar um aluno para a disciplina "${subject.nome}"?'),
      actions: [
        TextButton(
          onPressed: () {

            _bloc.add(AssociateSubjectEvent(subject: subject));

            Navigator.of(context).pop();
          },
          child: Text('Confirmar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
      ],
    ),
  );
}

}
