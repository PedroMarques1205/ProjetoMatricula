import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_with_subjects_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/course_list/widgets/course_list_item.dart';
import 'package:projeto_matricula_application/view/course_list/widgets/new_course_page.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_state.dart';
import '../main_screen/main_screen.dart';

class CoursesListPage extends StatelessWidget {
  CoursesListPage({super.key});

  List<CourseDTO> allCourses = [];
  final RegisterCoursePageBloc _bloc = RegisterCoursePageBloc();

  List<SubjectDTO> subjects = [];

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
          'Cursos',
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
      body: BlocProvider(
        create: (_) => _bloc,
        child: BlocBuilder<RegisterCoursePageBloc, RegisterCoursePageState>(
          builder: (context, state) {
            if (state is RegisterCoursePageInitState ||
                state is RegisterCoursePageStartState) {
              _bloc.add(RegisterCoursePageGetInfoEvent());
            }
            if (state is RegisterCoursesListLoaded) {
              allCourses = state.courses;
              subjects = state.subjects;

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
      ),
    );
  }

  void openNewCoursePage(BuildContext context) async {
    final CourseDTO? newCourse = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewCoursePage(
          allSubjects: subjects,
          onSave: (CourseDTO course, List<SubjectsSemester> subjects) async {
            _bloc.add(RegisterNewCourseEvent(course: course, subjects: subjects));
            await Future.delayed(const Duration(milliseconds: 300)); 
          }, subjectSemesters: [], 
        ),
      ),
    );
  }

  void onSave(CourseDTO course, List<SubjectsSemester> subjects) {
    _bloc.add(RegisterNewCourseEvent(course: course, subjects: subjects));
  }
}
