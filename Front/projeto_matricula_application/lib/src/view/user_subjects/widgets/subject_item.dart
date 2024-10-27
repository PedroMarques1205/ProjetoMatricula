import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

class SubjectItem extends StatelessWidget {
  final SubjectDTO subject;
  final List<Color> gradientColors;

  const SubjectItem(
      {super.key, required this.subject, required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.grey[600];

    return Container(
      padding: const EdgeInsets.all(10),
      width: 340,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradientColors),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject.nome ?? 'Nome',
            style: TextStyle(
                color: textColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            'Turno: Noite',
            style: TextStyle(color: textColor),
          ),
          Text(
            '${subject.descricao}',
            style: TextStyle(color: textColor),
          ),
          Row(
            children: [
              Text(
                subject.ativa == true ? 'Ativo' : 'Inválido',
                style: TextStyle(
                    color: subject.ativa == true ? Colors.green : Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
