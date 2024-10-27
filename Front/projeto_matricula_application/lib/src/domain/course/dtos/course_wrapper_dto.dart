import 'package:json_annotation/json_annotation.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_with_subjects_dto.dart';

part 'course_wrapper_dto.g.dart';

@JsonSerializable()
class CourseWithSubjectsWrapper {
  @JsonKey(name: 'curso')
  final CourseDTO course;

  @JsonKey(name: 'disciplinaComSemestre')
  final List<SubjectsSemester> subjects;

  CourseWithSubjectsWrapper({
    required this.course,
    required this.subjects,
  });

  factory CourseWithSubjectsWrapper.fromJson(Map<String, dynamic> json) => _$CourseWithSubjectsWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$CourseWithSubjectsWrapperToJson(this);
}
