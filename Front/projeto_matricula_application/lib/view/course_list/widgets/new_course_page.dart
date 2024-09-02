import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import '../../main_screen/main_screen.dart';

class NewCoursePage extends StatefulWidget {
  final Future<void> Function(CourseDTO course) onSave;
  final List<SubjectDTO> allSubjects;

  NewCoursePage({super.key, required this.onSave, required this.allSubjects});

  @override
  _NewCoursePageState createState() => _NewCoursePageState();
}

class _NewCoursePageState extends State<NewCoursePage> {
  late CourseDTO newCourse;

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _numSemestresController = TextEditingController();

  List<SubjectDTO> selectedSubjects = [];

  @override
  void initState() {
    super.initState();
    newCourse = CourseDTO();

    _nomeController.text = newCourse.nome ?? '';
    _descricaoController.text = newCourse.descricao ?? '';
    _numSemestresController.text = newCourse.numSemestres?.toString() ?? '';
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
      await widget.onSave(newCourse);
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
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: InputWidget(
                        controller: _descricaoController,
                        onChanged: (value) {
                          _updateCourse();
                        },
                        title: 'Descrição',
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: InputWidget(
                        controller: _numSemestresController,
                        onChanged: (value) {
                          _updateCourse();
                        },
                        title: 'Número de Semestres',
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InkWell(
                      onTap: _openSubjectsPopup,
                      child: Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ProjectColors.buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            selectedSubjects.isNotEmpty
                                ? selectedSubjects.map((s) => s.nome).join(', ')
                                : 'Escolha disciplinas...',
                            style: TextStyle(
                              color: selectedSubjects.isNotEmpty
                                  ? Colors.blue
                                  : Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300),
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

  void _openSubjectsPopup() {
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
                return RadioListTile<SubjectDTO>(
                  title: Text(subject.nome ?? ''),
                  value: subject,
                  groupValue: selectedSubjects.isNotEmpty
                      ? selectedSubjects.first
                      : null,
                  onChanged: (selected) {
                    setState(() {
                      if (selected != null) {
                        if (selectedSubjects.contains(selected)) {
                          selectedSubjects.remove(selected);
                        } else {
                          selectedSubjects.add(selected);
                        }
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
}
