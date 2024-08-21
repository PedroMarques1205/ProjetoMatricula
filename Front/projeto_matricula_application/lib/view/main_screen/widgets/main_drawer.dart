import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              padding: const EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.academicCap,
                  text: 'Matrícula',
                  width: 250,
                  onPressed: () {},
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Aluno)
            Padding(
              padding: const EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.currencyDollar,
                  text: 'Financeiro',
                  width: 250,
                  onPressed: () {},
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
          if (Context.current.tipoAcesso == UserTypeEnum.Aluno)
            Padding(
              padding: const EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  icon: HeroIcons.bookOpen,
                  text: 'Minhas Matérias',
                  width: 250,
                  onPressed: () {},
                  backgroundColor: ProjectColors.buttonColor,
                  textColor: Colors.grey[600],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
