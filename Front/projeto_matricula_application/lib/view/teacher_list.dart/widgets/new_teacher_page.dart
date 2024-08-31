import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import 'package:projeto_matricula_application/view/teacher_list.dart/register_teacher_page.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_teacher/register_teacher_page_event.dart';

class NewTeacherPage extends StatefulWidget {
  final void Function(UserDTO user) onSave;
  final RegisterTeacherPageBloc bloc;

  const NewTeacherPage({super.key, required this.onSave, required this.bloc});

  @override
  _NewTeacherPageState createState() => _NewTeacherPageState();
}

class _NewTeacherPageState extends State<NewTeacherPage> {
  late UserDTO newUser;

  @override
  void initState() {
    super.initState();
    newUser = UserDTO(tipoAcesso: UserTypeEnum.Professor, ativo: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Novo Professor',
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
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => TeachersListPage()),
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
                    padding: const EdgeInsets.only(top: 280),
                    child: ButtonWidget(
                      text: 'Salvar',
                      onPressed: () {
                        widget.bloc.add(RegisterNewTeacherEvent(user: newUser));
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => TeachersListPage()),
                          (route) => false,
                        );
                      },
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
