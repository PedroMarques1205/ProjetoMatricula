import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';
import 'package:projeto_matricula_application/view/subjects_list/widgets/new_subject_page.dart';
import 'package:projeto_matricula_application/view/user_subjects/widgets/subject_item.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_state.dart';

class SubjectsListPage extends StatefulWidget {
  @override
  _SubjectsListPageState createState() => _SubjectsListPageState();
}

class _SubjectsListPageState extends State<SubjectsListPage> {
  late final RegisterSubjectsBloc _bloc;
  List<SubjectDTO> allSubjects = [];

  @override
  void initState() {
    super.initState();
    _bloc = RegisterSubjectsBloc();
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
          style:
              TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
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
        actions: [
          TextButton(
            onPressed: () => openNewSubjectPage(context),
            child: const Text(
              'Novo',
              style: TextStyle(
                color: ProjectColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              width: 340,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: ProjectColors.buttonColor,
                ),
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<RegisterSubjectsBloc, RegisterSubjectsState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is SubjectListLoadedState) {
            allSubjects = state.subjects;

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: allSubjects.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: SubjectItem(
                        subject: allSubjects[index],
                        gradientColors: generateRandomGradientColors(),
                      ));
                },
              ),
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
    return [ProjectColors.buttonColor, ProjectColors.subjectCoolDark];
  }

  void openNewSubjectPage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => NewSubjectPage(
                bloc: _bloc,
              )),
      (route) => false,
    );
  }
}
