import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

class TeacherListItem extends StatelessWidget {
  final UserDTO teacher;

  const TeacherListItem({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        color: ProjectColors.buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[400],
            child: const HeroIcon(
              HeroIcons.user,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            teacher.nome ?? 'Professor', 
            style: TextStyle(color: Colors.grey[800]),
          )
        ],
      ),
    );
  }
}
