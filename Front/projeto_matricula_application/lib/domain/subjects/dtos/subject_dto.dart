import 'package:json_annotation/json_annotation.dart';

class SubjectDto {
  final String? name;
  final int? hours;
  final int? numberStudents;
  final SubjectShiftEnum? shift;

  SubjectDto({
    this.name,
    this.hours,
    this.numberStudents,
    this.shift,
  });
}

enum SubjectShiftEnum {
  @JsonValue('MANHA')
  manha,
  @JsonValue('NOITE')
  noite
}