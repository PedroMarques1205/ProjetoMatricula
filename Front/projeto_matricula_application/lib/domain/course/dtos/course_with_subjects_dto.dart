import 'package:json_annotation/json_annotation.dart';

part 'course_with_subjects_dto.g.dart';

@JsonSerializable()
class SubjectsSemester {
  int? idDisciplina;
  int? ordinalSemestre;

  SubjectsSemester({
    this.idDisciplina,
    this.ordinalSemestre,
  });

  factory SubjectsSemester.fromJson(Map<String, dynamic> json) => _$SubjectsSemesterFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectsSemesterToJson(this);
}
