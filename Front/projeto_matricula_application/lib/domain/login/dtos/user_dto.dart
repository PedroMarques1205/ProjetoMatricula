import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  String? nome;
  String? senha;
  UserTypeEnum? tipoAcesso;
  bool? ativo;
  String? matricula;

  UserDTO({
    this.nome,
    this.senha,
    this.tipoAcesso,
    this.ativo,
    this.matricula,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return _$UserDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

enum UserTypeEnum {
  @JsonValue('SECRETARIA')
  Secretaria,
  @JsonValue('PROFESSOR')
  Professor,
  @JsonValue('ALUNO')
  Aluno,
}
