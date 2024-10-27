import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

import '../teacher_list.dart/widgets/teacher_list_item.dart';

import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_state.dart';
import 'package:projeto_matricula_application/view/teacher_list.dart/widgets/new_teacher_page.dart';

import '../main_screen/main_screen.dart';

class TeachersListPage extends StatelessWidget {
  TeachersListPage({super.key});

  List<UserDTO> allTeachers = [];

  final RegisterTeacherPageBloc _bloc = RegisterTeacherPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Professores',
          style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
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
            onPressed: () => openNewTeacherPage(context),
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
      body: BlocBuilder<RegisterTeacherPageBloc, RegisterTeacherPageState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is RegisterTeacherPageInitState ||
              state is RegisterTeacherPageStartState) {
            _bloc.add(RegisterTeacherPageGetInfoEvent());
          }
          if (state is RegisterTeachersListLoaded) {
            allTeachers = state.teachers;

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: allTeachers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: TeacherListItem(teacher: allTeachers[index]),
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

  void openNewTeacherPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewTeacherPage(
                onSave: (UserDTO user) {
                }, bloc: _bloc,
              )),
    );
  }
}

Widget _buildCustomButton({
  required BuildContext context,
  required String label,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      backgroundColor: ProjectColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
