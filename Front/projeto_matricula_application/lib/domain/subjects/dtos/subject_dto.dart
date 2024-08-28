import 'package:json_annotation/json_annotation.dart';

part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDTO {
  String? id;
  String? nome;
  String? descricao;
  bool? ativa;

  factory SubjectDTO.fromJson(Map<String, dynamic> json) {
    return _$SubjectDTOFromJson(json);
  }

  SubjectDTO({this.id, this.nome, this.descricao, this.ativa});

  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);
}
