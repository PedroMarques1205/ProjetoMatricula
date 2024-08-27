import 'package:json_annotation/json_annotation.dart';

part 'course_dto.g.dart';

@JsonSerializable()
class CourseDTO {
  String? id;
  String? nome;
  String? codigo;
  String? descricao;
  bool? ativo;
  int? numSemestres;

  CourseDTO({
    this.id,
    this.nome,
    this.codigo,
    this.descricao,
    this.ativo,
    this.numSemestres
  });

  factory CourseDTO.fromJson(Map<String, dynamic> json) {
    return _$CourseDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseDTOToJson(this);
}
