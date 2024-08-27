import 'package:json_annotation/json_annotation.dart';

part 'course_dto.g.dart';

@JsonSerializable()
class CourseDTO {
  String? id;
  String? nome;
  String? codigo;
  bool? ativo;

  CourseDTO({
    this.id,
    this.nome,
    this.codigo,
    this.ativo,
  });

  factory CourseDTO.fromJson(Map<String, dynamic> json) {
    return _$CourseDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseDTOToJson(this);
}
