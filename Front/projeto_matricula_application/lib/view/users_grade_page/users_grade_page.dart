import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';
import 'package:projeto_matricula_application/view/main_screen/widgets/main_drawer.dart';
import 'package:projeto_matricula_application/view/users_grade_page/widget/course_semester_item.dart';
import 'package:projeto_matricula_application/viewmodel/course_grade_bloc/course_grade_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/course_grade_bloc/course_grade_event.dart';
import 'package:projeto_matricula_application/viewmodel/course_grade_bloc/course_grade_state.dart';

class UsersGradePage extends StatefulWidget {
  @override
  State<UsersGradePage> createState() => UsersGradePageState();
}

class UsersGradePageState extends State<UsersGradePage> {
  CourseDTO course = CourseDTO();
  List<CourseSubjectsDTO> subjects = [];
  late CourseGradeBloc _bloc;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = CourseGradeBloc();
    _bloc.add(CourseGradeListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: const HeroIcon(HeroIcons.bars3,
              color: ProjectColors.primaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const HeroIcon(
                HeroIcons.bell,
                color: ProjectColors.primaryLight,
                size: 25,
              ))
        ],
      ),
      drawer: const DrawerWidget(),
      body: BlocConsumer<CourseGradeBloc, CourseGradeState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is CourseGradeLoadedState) {
            setState(() {
              course = state.course;
              subjects = state.subjects;
            });
          }
        },
        builder: (context, state) {
          if (state is LoadCourseErrorState) {
            return Center(
                child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'Parece que você não está vinculado(a) a nenhum curso.',
                style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
              ),
            ));
          }
          if (state is CourseGradeLoadedState) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 15, bottom: 15),
                      child: RichText(
                        text: TextSpan(
                          text: 'Aqui está o currículo do curso ',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text: '${course.nome}.',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 600,
                      child: ListView.builder(
                        itemCount: course.numSemestres,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: CourseSemesterItem(
                              subjects: subjects,
                              semesterIndex: index,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ));
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
