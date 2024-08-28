import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import '../register_course_page.dart';
import '../../main_screen/main_screen.dart';

class NewCoursePage extends StatefulWidget {
  final Future<CourseDTO?> Function(CourseDTO course) onSave;

  NewCoursePage({super.key, required this.onSave});

  @override
  _NewCoursePageState createState() => _NewCoursePageState();
}

class _NewCoursePageState extends State<NewCoursePage> {
  final CourseDTO newCourse = CourseDTO();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _numSemestresController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomeController.text = newCourse.nome ?? '';
    _descricaoController.text = newCourse.descricao ?? '';
    _numSemestresController.text = newCourse.numSemestres?.toString() ?? '';
  }

  void _handleSave() async {
    newCourse.nome = _nomeController.text;
    newCourse.descricao = _descricaoController.text;
    newCourse.numSemestres = int.tryParse(_numSemestresController.text);

    final isValid = _validateCourse(newCourse);
    if (isValid) {
      final savedCourse = await widget.onSave(newCourse);
      if (savedCourse != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao salvar o curso.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos corretamente.')),
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
          style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: TextFormField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        newCourse.nome = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: TextFormField(
                      controller: _descricaoController,
                      decoration: InputDecoration(
                        labelText: 'Descrição',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        newCourse.descricao = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: TextFormField(
                      controller: _numSemestresController,
                      decoration: InputDecoration(
                        labelText: 'Número Semestres',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        newCourse.numSemestres = int.tryParse(value);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: Row(
                      children: [
                        Expanded(child: Text('Ativo')),
                        Switch(
                          value: newCourse.ativo ?? true,
                          onChanged: (value) {
                            setState(() {
                              newCourse.ativo = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
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
