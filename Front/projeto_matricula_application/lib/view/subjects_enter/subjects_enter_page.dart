import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
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
          if (state is SubjectListLoadingErrorState) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                    'Ops! Ocorreu um erro no carregamento.\nTente novamente mais tarde.'),
              ),
            );
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
                      itemCount: mySubjects.length + courseSubjects.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 15),
                            child: Text(
                              'Minhas matérias',
                              style: TextStyle(
                                  color: ProjectColors.primaryColor,
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
                        } else if (index == mySubjects.length) {
                          return const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'Todas matérias',
                                  style: TextStyle(
                                      color: ProjectColors.blueButtonColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        } else {
                          int courseIndex = index - mySubjects.length - 1;
                          return buildSubjectItemButWithOtherType(
                              courseSubjects[courseIndex], courseIndex);
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
                                onPressed: () {},
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

  List<Color> generateRandomGradientColors(int index) {
    if (index % 2 == 0) {
      return [ProjectColors.subjectLight, ProjectColors.primaryLight];
    } else {
      return [ProjectColors.subjectCoolLight, ProjectColors.subjectCoolDark];
    }
  }

  void registerStudent() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cadastrar Aluno'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<SubjectDTO>(
              value: _selectedSubject,
              items: mySubjects.map((subject) {
                return DropdownMenuItem<SubjectDTO>(
                  value: subject,
                  child: Text(subject.nome ?? 'Nome não disponível'),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedSubject = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Disciplina',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _matriculaController,
              decoration: const InputDecoration(
                labelText: 'Matrícula do Aluno',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final matricula = _matriculaController.text.trim();
              if (_selectedSubject != null && matricula.isNotEmpty) {
                _bloc.add(
                  AssociateSubjectEvent(
                    subject: _selectedSubject!,
                    matricula: matricula,
                  ),
                );
                Navigator.of(context).pop();
                _matriculaController.clear();
                setState(() {
                  _selectedSubject = null;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Por favor, preencha todos os campos.')),
                );
              }
            },
            child: const Text('Confirmar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _matriculaController.clear();
              setState(() {
                _selectedSubject = null;
              });
            },
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}
