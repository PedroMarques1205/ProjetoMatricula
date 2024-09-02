import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import '../register_student_page.dart';

class NewStudentPage extends StatefulWidget {
  final void Function(UserDTO user, CourseDTO selectedCourse, int semesrer) onSave;
  final List<CourseDTO> courses;

  NewStudentPage({super.key, required this.onSave, required this.courses});

  @override
  _NewStudentPageState createState() => _NewStudentPageState();
}

class _NewStudentPageState extends State<NewStudentPage> {
  late UserDTO newUser;
  CourseDTO selectedCourse = CourseDTO();
  int? selectedSemester;

  @override
  void initState() {
    super.initState();
    newUser = UserDTO(tipoAcesso: UserTypeEnum.Aluno, ativo: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Novo Aluno',
          style:
              TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ProjectColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const StudentsListPage()),
              (route) => false,
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const StudentsListPage()),
                (route) => false,
              );
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
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 45,
                            child: const HeroIcon(
                              HeroIcons.user,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: ProjectColors.primaryLight,
                            radius: 20,
                            child: HeroIcon(
                              HeroIcons.camera,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      title: 'Nome',
                      onChanged: (value) {
                        setState(() {
                          newUser.nome = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      title: 'Matrícula',
                      onChanged: (value) {
                        setState(() {
                          newUser.matricula = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InputWidget(
                      title: 'Senha',
                      onChanged: (value) {
                        setState(() {
                          newUser.senha = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: InkWell(
                      onTap: _openCoursesPopup,
                      child: Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ProjectColors.buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            selectedCourse?.nome ?? 'Escolha um curso...',
                            style: TextStyle(
                              color: selectedCourse?.nome != null && selectedCourse!.nome!.isNotEmpty ? Colors.blue : Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (selectedCourse != null)
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ProjectColors.buttonColor,
                          ),
                          height: 70,
                          width: 300,
                          child: DropdownButton<int>(
                            dropdownColor: Colors.white,
                            focusColor: Colors.white,
                            value: selectedSemester,
                            hint: const Text('Selecione um semestre'),
                            isExpanded: true,
                            items: List.generate(
                              selectedCourse!.numSemestres ?? 8,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text('Semestre ${index + 1}'),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedSemester = value;
                              });
                            },
                          ),
                        )),
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: ButtonWidget(
                      text: 'Salvar',
                      onPressed: () {
                        widget.onSave(newUser, selectedCourse, selectedSemester ?? 1);
                        try {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const StudentsListPage(),
                            ),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
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

  void _openCoursesPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Cursos',
            style:
                TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.courses.length,
              itemBuilder: (BuildContext context, int index) {
                final course = widget.courses[index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ProjectColors.buttonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: HeroIcon(
                              HeroIcons.academicCap,
                              color: ProjectColors.primaryLight,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(course.nome ?? ''),
                            onTap: () {
                              setState(() {
                                selectedCourse = course;
                                selectedSemester = 1;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
