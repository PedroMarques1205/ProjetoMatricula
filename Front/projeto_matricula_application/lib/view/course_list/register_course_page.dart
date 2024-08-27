import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_state.dart';

class CoursesListPage extends StatelessWidget {
  CoursesListPage({super.key});

  List<CourseDTO> allCourses = [];

  final RegisterCoursePageBloc _bloc = RegisterCoursePageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Disciplinas',
          style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ProjectColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () => openNewCoursePage(context),
            child: const Text(
              'Novo',
              style: TextStyle(
                color: ProjectColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
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
      body: BlocBuilder<RegisterCoursePageBloc, RegisterCoursePageState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is RegisterCoursePageInitState ||
              state is RegisterCoursePageStartState) {
            _bloc.add(RegisterCoursePageGetInfoEvent());
          }
          if (state is RegisterCoursesListLoaded) {
            allCourses = state.courses;

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: allCourses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: CourseListItem(course: allCourses[index]),
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

  void openNewCoursePage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewCoursePage(
          onSave: (CourseDTO course) => onSave(course),
        ),
      ),
    );
  }

  void onSave(CourseDTO course) {
    _bloc.add(RegisterNewCourseEvent(course: course));
  }
}
