import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/main_screen/main_screen.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_state.dart';

class SubjectsListPage extends StatelessWidget {
  final RegisterSubjectsBloc _bloc = RegisterSubjectsBloc();
  List<SubjectDTO> allSubjects = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Disciplinas',
          style: TextStyle(color: Colors.grey[800]),
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
          if (state is RegisterSubjectsInitState) {
            _bloc.add(ListSubjectsEvent());
          }
          if (state is SubjectListLoadedState) {
            allSubjects = state.subjects;

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: allSubjects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Container()
                  );
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

  void openNewSubjectPage(BuildContext context) {}
  
}