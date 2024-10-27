import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import '../main_screen/main_screen.dart';
import '../../viewmodel/blocs/professor_page/professor_course_page_bloc.dart';
import '../../viewmodel/blocs/professor_page/professor_course_page_event.dart';
import '../../viewmodel/blocs/professor_page/professor_course_page_state.dart';
import 'widgets/subject_list_item.dart';

class ClassProfessorPage extends StatefulWidget {
  ClassProfessorPage({super.key});

  @override
  _ClassProfessorPageState createState() => _ClassProfessorPageState();
}

class _ClassProfessorPageState extends State<ClassProfessorPage> {
  List<SubjectDTO> allDisciplines = [];
  late ProfessorPageBloc _bloc;
  String? professorId; // Altere para String

  @override
  void initState() {
    super.initState();
    _bloc = ProfessorPageBloc();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showProfessorIdDialog(context);
      if (professorId != null) {
        _bloc.add(
            ProfessorPageGetDisciplinesEvent(matriculaProfessor: professorId!));
      }
    });
  }

  Future<void> _showProfessorIdDialog(BuildContext context) async {
    TextEditingController idController = TextEditingController();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          title: Text(
            'Confirme sua matrícula:',
            style: TextStyle(color: Colors.grey[800]),
          ),
          content: TextField(
            controller: idController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Matrícula"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: ProjectColors.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(color: ProjectColors.primaryColor),
              ),
              onPressed: () {
                setState(() {
                  professorId = idController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.white,
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            'Disciplinas do Professor',
            style:
                TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ProjectColors.primaryLight,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (route) => false,
              );
            },
          ),
        ),
        body: BlocBuilder<ProfessorPageBloc, ProfessorPageState>(
          builder: (context, state) {
            if (state is ProfessorPageLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfessorDisciplinesLoaded) {
              allDisciplines = state.disciplines;
              return ListView.builder(
                itemCount: allDisciplines.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: SubjectListItem(subject: allDisciplines[index]),
                  );
                },
              );
            } else if (state is ProfessorDisciplinesError) {
              return Center(child: Text('Erro: ${state.message}'));
            } else {
              return const Center(
                  child: Text('Nenhuma disciplina encontrada.'));
            }
          },
        ),
      ),
    );
  }
}
