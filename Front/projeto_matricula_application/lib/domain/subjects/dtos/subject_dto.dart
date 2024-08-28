import 'package:json_annotation/json_annotation.dart';

part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDTO {
  final String? name;
  final int? hours;
  final int? numberStudents;
  final SubjectShiftEnum? shift;

  SubjectDTO({
    this.name,
    this.hours,
    this.numberStudents,
    this.shift,
  });

  factory SubjectDTO.fromJson(Map<String, dynamic> json) {
    return _$SubjectDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);
}

enum SubjectShiftEnum {
  @JsonValue('MANHA')
  manha,
  @JsonValue('NOITE')
  noite
}
