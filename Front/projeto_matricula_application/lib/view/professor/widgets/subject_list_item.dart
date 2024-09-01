import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

class SubjectListItem extends StatelessWidget {
  final SubjectDTO subject;

  const SubjectListItem({super.key, required this.subject});

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
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.book,
              color: ProjectColors.primaryLight,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject.nome ?? 'Disciplina',
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
                Text(
                  subject.descricao ?? 'Descrição',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
