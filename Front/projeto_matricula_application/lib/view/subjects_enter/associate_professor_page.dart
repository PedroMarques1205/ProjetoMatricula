import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import '../../viewmodel/blocs/subjects_enter_page/enter_subjects_bloc.dart';
import '../../viewmodel/blocs/subjects_enter_page/enter_subjects_event.dart';
import '../../viewmodel/blocs/subjects_enter_page/enter_subjects_state.dart';
import '../main_screen/main_screen.dart';

class AssociateProfessorPage extends StatefulWidget {
  const AssociateProfessorPage({super.key});

  @override
  _AssociateProfessorPageState createState() => _AssociateProfessorPageState();
}

class _AssociateProfessorPageState extends State<AssociateProfessorPage> {
  String _professorId = '';
  String _subjectName = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnterSubjectsBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            'Associar Professor a Disciplina',
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
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'ID do Professor',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _professorId = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome da Disciplina',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _subjectName = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<EnterSubjectsBloc>().add(
                        AssociateProfessorEvent(
                          professorId: _professorId,
                          subjectName: _subjectName,
                        ),
                      );
                    },
                    child: const Text('Associar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
