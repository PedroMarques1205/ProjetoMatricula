import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/view/students_list.dart/widgets/new_student_page.dart';
import 'package:projeto_matricula_application/view/students_list.dart/widgets/student_list_item.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_state.dart';
import '../main_screen/main_screen.dart';

class StudentsListPage extends StatefulWidget {
  const StudentsListPage({Key? key}) : super(key: key);

  @override
  _StudentsListPageState createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  List<UserDTO> allStudents = [];
  List<CourseDTO> courses = [];
  CourseDTO selectedCourse = CourseDTO();
  final RegisterStudentPageBloc _bloc = RegisterStudentPageBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(RegisterStudentPageGetInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Alunos',
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
            onPressed: () => openNewStudentPage(context),
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
      body: BlocBuilder<RegisterStudentPageBloc, RegisterStudentPageState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is NewStudentRegisteredState) {
            allStudents.add(state.user);
          }
          if (state is NewStudentCreationErrorState) {
            return const Center(
              child:
                  HeroIcon(HeroIcons.heart, color: ProjectColors.primaryColor),
            );
          }
          if (state is RegisterStudentsListLoaded) {
            allStudents = state.students;
            courses = state.courses;

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: allStudents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: StudentListItem(student: allStudents[index]),
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

  void openNewStudentPage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => NewStudentPage(
          onSave: (UserDTO user, CourseDTO course, int semester) =>
              onSave(user, course, semester),
          courses: courses,
        ),
      ),
      (route) => false,
    );
  }

  void onSave(UserDTO user, CourseDTO course, int semester) {
    try {
      _bloc.add(RegisterNewStudentEvent(user: user, course: course));
    } catch (error) {
      print(error);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
