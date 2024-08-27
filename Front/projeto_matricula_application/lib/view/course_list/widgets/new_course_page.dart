import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import '../register_course_page.dart';

class NewCoursePage extends StatelessWidget {
  final void Function(CourseDTO course) onSave;

  NewCoursePage({super.key, required this.onSave});

  final CourseDTO newCourse = CourseDTO(ativo: true);

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
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => CoursesListPage()),
              (route) => false,
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => CoursesListPage()),
                (route) => false,
              );
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: ProjectColors.primaryColor),
            ),
          )
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
                    child: InputWidget(
                      title: 'ID',
                      onChanged: (value) {
                        newCourse.id = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      title: 'Nome',
                      onChanged: (value) {
                        newCourse.nome = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      title: 'Descrição',
                      onChanged: (value) {
                        newCourse.descricao = value;
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
                            newCourse.ativo = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ButtonWidget(
                      text: 'Salvar',
                      onPressed: () => onSave(newCourse),
                      width: 345,
                      backgroundColor: ProjectColors.primaryLight,
                      textColor: Colors.white,
                      centerTitle: true,
                      radius: 25,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
