import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';

class CourseSemesterItem extends StatefulWidget {
  final List<CourseSubjectsDTO> subjects;
  final int semesterIndex;

  const CourseSemesterItem({
    super.key,
    required this.subjects,
    required this.semesterIndex,
  });

  @override
  _CourseSemesterItemState createState() => _CourseSemesterItemState();
}

class _CourseSemesterItemState extends State<CourseSemesterItem> {
  late List<CourseSubjectsDTO> filteredSubjects;

  @override
  void initState() {
    super.initState();
    _filterSubjects();
  }

  void _filterSubjects() {
    filteredSubjects = widget.subjects.where((subject) => subject.semestre?.id?.ordinal == widget.semesterIndex + 1).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ProjectColors.buttonColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent, 
        ),
        child: ExpansionTile(
          title: Row(
            children: [
              const Icon(Icons.school, color: ProjectColors.primaryColor),
              const SizedBox(width: 8),
              Text(
                'Semestre ${widget.semesterIndex + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ProjectColors.primaryColor,
                ),
              ),
            ],
          ),
          childrenPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          children: filteredSubjects.isNotEmpty
              ? filteredSubjects.map((subject) {
                  return Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.book, color: ProjectColors.primaryLight),
                        title: Text(
                            subject.disciplina?.nome ?? 'Matéria desconhecida'),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      if (filteredSubjects.last != subject)
                        const Divider(), 
                    ],
                  );
                }).toList()
              : [
                  const ListTile(
                    title: Text('Nenhuma matéria encontrada',
                        textAlign: TextAlign.center),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                  ),
                ],
        ),
      ),
    );
  }
}
