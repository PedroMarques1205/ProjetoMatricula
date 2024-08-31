import 'package:json_annotation/json_annotation.dart';

part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDTO {
  int? id;
  String? nome;
  String? descricao;
  bool? ativa;

  SubjectDTO({
    this.id,
    this.nome,
    this.descricao,
    this.ativa,
  });

  factory SubjectDTO.fromJson(Map<String, dynamic> json) => _$SubjectDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);

  @override
  String toString() {
    return 'SubjectDTO(id: $id, nome: $nome, descricao: $descricao, ativa: $ativa)';
  }
}
