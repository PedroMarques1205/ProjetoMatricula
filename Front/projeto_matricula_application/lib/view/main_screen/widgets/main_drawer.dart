import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/view/course_list/register_course_page.dart';
import 'package:projeto_matricula_application/view/emitir_boleto_page/emitir_boleto_page.dart';
import 'package:projeto_matricula_application/view/login/login_page.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/students_list.dart/register_student_page.dart';
import 'package:projeto_matricula_application/view/subjects_enter/subjects_enter_page.dart';
import 'package:projeto_matricula_application/view/subjects_list/subjects_list_page.dart';
import 'package:projeto_matricula_application/view/teacher_list.dart/register_teacher_page.dart';
import '.././../professor/professor_page.dart';
import '../../pagamento/pagamento_alert.dart';
import '../../subjects_enter/associate_professor_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: ProjectColors.primaryLight),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: HeroIcon(
                      HeroIcons.user,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${Context.current.nome}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      '${Context.current.tipoAcesso?.name}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (Context.current.tipoAcesso == UserTypeEnum.Aluno)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.bookOpen,
                  text: 'Disciplinas',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectsEnterPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Aluno)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.currencyDollar,
                  text: 'Financeiro',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => PagamentoAlert()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Secretaria)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.academicCap,
                  text: 'Cursos',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CoursesListPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Secretaria)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.users,
                  text: 'Alunos',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentsListPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Secretaria)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.users,
                  text: 'Professores',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeachersListPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Secretaria)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.bookOpen,
                  text: 'Disciplinas',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubjectsListPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Professor)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.bookOpen,
                  text: 'Suas matérias',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClassProfessorPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Secretaria)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.bookmark,
                  text: 'Designar Professor',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AssociateProfessorPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Secretaria)
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.archiveBox,
                  text: 'Emitir Boleto',
                  width: 250,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmitirBoletoPage()),
                      (route) => false,
                    );
                  },
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 5, left: 5, top: 10),
            child: Align(
              alignment: Alignment.center,
              child: ButtonWidget(
                icon: HeroIcons.arrowTopRightOnSquare,
                text: 'Sair',
                width: 250,
                onPressed: () => _redoLogin(context),
                backgroundColor: ProjectColors.buttonColor,
                textColor: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _redoLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );

    Context.currentUser = UserDTO();
  }
}
