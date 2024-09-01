import 'package:json_annotation/json_annotation.dart';

part 'teacher_dto.g.dart';

@JsonSerializable()
class TeacherDTO {
  String? matricula;
  String? nome;
  String? senha;
  String? tipoAcesso;
  bool? ativo;

  TeacherDTO({
    this.matricula,
    this.nome,
    this.senha,
    this.tipoAcesso,
    this.ativo,
  });

  factory TeacherDTO.fromJson(Map<String, dynamic> json) => _$TeacherDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherDTOToJson(this);

  @override
  String toString() {
    return 'TeacherDTO(matricula: $matricula, nome: $nome, senha: $senha, tipoAcesso: $tipoAcesso, ativo: $ativo)';
  }
}
