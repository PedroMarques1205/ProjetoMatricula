import 'package:json_annotation/json_annotation.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';

part 'semester_dto.g.dart';

@JsonSerializable()
class SemesterDTO {
  SemestreId? id;

  SemesterDTO({
    this.id,
  });

  factory SemesterDTO.fromJson(Map<String, dynamic> json) => _$SemesterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterDTOToJson(this);
}

@JsonSerializable()
class SemestreId {
  int? ordinal;
  CourseDTO? curso;

  SemestreId({
    this.ordinal,
    this.curso,
  });

  factory SemestreId.fromJson(Map<String, dynamic> json) => _$SemestreIdFromJson(json);

  Map<String, dynamic> toJson() => _$SemestreIdToJson(this);
}
