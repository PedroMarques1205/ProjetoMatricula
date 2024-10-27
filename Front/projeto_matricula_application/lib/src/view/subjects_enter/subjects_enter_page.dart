import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';
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
  final _matriculaController = TextEditingController();
  SubjectDTO? _selectedSubject;
  bool _isOptative = false;

  List<SubjectDTO> mySubjects = [];
  List<CourseSubjectsDTO> courseSubjects = [];
  CourseDTO course = CourseDTO();

  @override
  void initState() {
    super.initState();
    _bloc = EnterSubjectsBloc();
    _bloc.add(ListSubjectsEvent());
  }

  @override
  void dispose() {
    _matriculaController.dispose();
    super.dispose();
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
          'Matrícula',
          style: TextStyle(
            color: Colors.grey[600],
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
          if (state is ReloadingRegisterPageState) {
            _bloc.add(ReloadingRegisterPageEvent());
            return const Center(
              child: CircularProgressIndicator(
                color: ProjectColors.primaryColor,
              ),
            );
          }
          if (state is SubjectListLoadingErrorState) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Parece que você não está vinculado(a) a nenhum curso.',
                style: TextStyle(
                    color: Colors.grey[600], fontWeight: FontWeight.bold),
              ),
            ));
          }
          if (state is SubjectListLoadedState) {
            mySubjects = state.mySubjects;
            courseSubjects = state.otherSubjects;
            course = state.course;

            return ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: mySubjects.length + courseSubjects.length + 2,
                      itemBuilder: (context, index) {
                        if (index == 0 && mySubjects.isNotEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 15),
                            child: Text(
                              'Minhas matérias',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }

                        if (index < mySubjects.length) {
                          return buildSubjectItem(
                              mySubjects[index],
                              index,
                              index == mySubjects.length - 1 ||
                                  index == mySubjects.length - 2);
                        }

                        if (index == mySubjects.length) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Todas matérias',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        }

                        int courseIndex = index - mySubjects.length - 1;
                        if (courseIndex < courseSubjects.length) {
                          return buildSubjectItemButWithOtherType(
                              courseSubjects[courseIndex], courseIndex);
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ]);
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

  Widget buildSubjectItem(SubjectDTO subject, int index, bool isOptional) {
    return Card(
        color: ProjectColors.buttonColor,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: ThemeData(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: Text(
              isOptional
                  ? '${subject.nome} - Opcional'
                  : subject.nome ?? 'Nome',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isOptional ? Colors.pink : ProjectColors.primaryColor,
              ),
            ),
            leading: Icon(
              Icons.book,
              color: isOptional ? Colors.pink : ProjectColors.primaryColor,
            ),
            childrenPadding: const EdgeInsets.all(10),
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Período: 1',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Turno: Noite',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Professor',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Cancelar matrícula',
                                  style: TextStyle(color: Colors.red),
                                )),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ));
  }

  Widget buildSubjectItemButWithOtherType(
      CourseSubjectsDTO subject, int index) {
    return Card(
        color: ProjectColors.buttonColor,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: ThemeData(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: Text(
              subject.disciplina?.nome ?? 'Nome',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ProjectColors.blueButtonColor,
              ),
            ),
            leading:
                const Icon(Icons.book, color: ProjectColors.blueButtonColor),
            childrenPadding: const EdgeInsets.all(10),
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Período',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Turno',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Professor',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (mySubjects.length >= 5) {
                                    _showAlert('Número máximo de matrículas',
                                        'Você atingiu o número máximo de 5 disciplinas matriculadas.');
                                    return;
                                  }
                                  _selectedSubject = subject.disciplina;
                                  _showOptativeDialog();
                                },
                                child: const Text(
                                  'Matricular-se',
                                  style: TextStyle(
                                      color: ProjectColors.blueButtonColor),
                                )),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ));
  }

  void _showOptativeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Matéria Optativa'),
          content:
              const Text('Você deseja adicionar esta matéria como optativa?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isOptative = false;
                });
                registerStudent();
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isOptative = true;
                });
                registerStudent();
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  void _showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void registerStudent() {
    if (_selectedSubject != null) {
      _bloc.add(
        AssociateSubjectEvent(
          subject: _selectedSubject!,
          matricula: Context.current.matricula!,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Matriculado(a) na disciplina ${_selectedSubject!.nome} como ${_isOptative ? "optativa" : "regular"}'),
        ),
      );
    }
  }
}
