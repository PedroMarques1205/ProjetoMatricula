import 'package:json_annotation/json_annotation.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/semester/semester_dto.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

part 'course_subjects_dto.g.dart'; 

@JsonSerializable()
class CourseSubjectsDTO {
  int? id;
  SubjectDTO? disciplina;
  CourseDTO? curso;
  SemesterDTO? semestre;

  CourseSubjectsDTO({
    this.id,
    this.disciplina,
    this.curso,
    this.semestre,
  });

  factory CourseSubjectsDTO.fromJson(Map<String, dynamic> json) => _$CourseSubjectsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CourseSubjectsDTOToJson(this);
}
