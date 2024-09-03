import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_with_subjects_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import '../../main_screen/main_screen.dart';

class NewCoursePage extends StatefulWidget {
  final Future<void> Function(
      CourseDTO course, List<SubjectsSemester> subjectSemesters) onSave;
  final List<SubjectDTO> allSubjects;
  final List<SubjectsSemester> subjectSemesters;

  NewCoursePage({
    super.key,
    required this.onSave,
    required this.allSubjects,
    required this.subjectSemesters,
  });

  @override
  _NewCoursePageState createState() => _NewCoursePageState();
}

class _NewCoursePageState extends State<NewCoursePage> {
  late CourseDTO newCourse;
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _numSemestresController = TextEditingController();

  Map<int, List<SubjectDTO>> semesterSubjects = {};

  @override
  void initState() {
    super.initState();
    newCourse = CourseDTO();

    _nomeController.text = newCourse.nome ?? '';
    _descricaoController.text = newCourse.descricao ?? '';
    _numSemestresController.text = newCourse.numSemestres?.toString() ?? '';

    _initializeSubjectsBySemester();
  }

  void _initializeSubjectsBySemester() {
    for (var subjectSemester in widget.subjectSemesters) {
      if (subjectSemester.ordinalSemestre != null &&
          subjectSemester.idDisciplina != null) {
        final semester = subjectSemester.ordinalSemestre!;
        final subjectId = subjectSemester.idDisciplina!;

        final subject = widget.allSubjects.firstWhere(
          (subject) => subject.id == subjectId,
          orElse: () => SubjectDTO(),
        );

        if (!semesterSubjects.containsKey(semester)) {
          semesterSubjects[semester] = [];
        }

        if (subject.id != null) {
          semesterSubjects[semester]!.add(subject);
        }
      }
    }
  }

  void _updateCourse() {
    setState(() {
      newCourse.nome = _nomeController.text;
      newCourse.descricao = _descricaoController.text;
      newCourse.numSemestres = int.tryParse(_numSemestresController.text);
      newCourse.ativo = newCourse.ativo ?? true;
    });
  }

  void _handleSave() async {
    _updateCourse();

    final isValid = _validateCourse(newCourse);
    if (isValid) {
      await widget.onSave(newCourse, widget.subjectSemesters);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos corretamente.')),
      );
    }
  }

  bool _validateCourse(CourseDTO course) {
    return course.nome != null &&
        course.descricao != null &&
        course.numSemestres != null &&
        course.numSemestres! > 0;
  }

  void _openSubjectsPopup(int semester) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Disciplinas',
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: widget.allSubjects.map((subject) {
                return CheckboxListTile(
                  title: Text(subject.nome ?? ''),
                  value: semesterSubjects[semester]?.contains(subject) ?? false,
                  onChanged: (bool? selected) {
                    setState(() {
                      if (selected == true) {
                        if (!semesterSubjects.containsKey(semester)) {
                          semesterSubjects[semester] = [];
                        }
                        semesterSubjects[semester]!.add(subject);
                        widget.subjectSemesters.add(
                          SubjectsSemester(
                            idDisciplina: subject.id,
                            ordinalSemestre: semester,
                          ),
                        );
                      } else {
                        semesterSubjects[semester]?.remove(subject);
                        widget.subjectSemesters.removeWhere((element) =>
                            element.idDisciplina == subject.id &&
                            element.ordinalSemestre == semester);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: ProjectColors.primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Novo Curso',
          style:
              TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: ProjectColors.primaryColor),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      controller: _nomeController,
                      onChanged: (value) {
                        _updateCourse();
                      },
                      title: 'Nome',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      controller: _descricaoController,
                      onChanged: (value) {
                        _updateCourse();
                      },
                      title: 'Descrição',
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      controller: _numSemestresController,
                      onChanged: (value) {
                        _updateCourse();
                      },
                      title: 'Número de Semestres',
                    ),
                  ),
                  ...List.generate(
                      newCourse.numSemestres ?? 0,
                      (index) => Theme(
                            data: ThemeData(
                              dividerColor: Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ProjectColors.buttonColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: ExpansionTile(
                                  title: Text('Semestre ${index + 1}'),
                                  children: [
                                    if (semesterSubjects[index + 1] == null ||
                                        semesterSubjects[index + 1]!.isEmpty)
                                      TextButton(
                                        onPressed: () {
                                          _openSubjectsPopup(index + 1);
                                        },
                                        child: Text('Adicionar matéria'),
                                      )
                                    else
                                      Column(
                                        children: [
                                          ...semesterSubjects[index + 1]!.map(
                                            (subject) => ListTile(
                                              title: Text(subject.nome ?? ''),
                                              trailing: IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () {
                                                  setState(() {
                                                    semesterSubjects[index + 1]!
                                                        .remove(subject);
                                                    widget.subjectSemesters
                                                        .removeWhere((element) =>
                                                            element.idDisciplina ==
                                                                subject.id &&
                                                            element.ordinalSemestre ==
                                                                index + 1);
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _openSubjectsPopup(index + 1);
                                            },
                                            child: Text('Adicionar matéria'),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ButtonWidget(
                      text: 'Salvar',
                      onPressed: _handleSave,
                      width: 345,
                      backgroundColor: ProjectColors.primaryLight,
                      textColor: Colors.white,
                      centerTitle: true,
                      radius: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
