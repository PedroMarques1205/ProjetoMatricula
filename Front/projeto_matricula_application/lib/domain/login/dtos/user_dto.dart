import 'package:json_annotation/json_annotation.dart';

// FALTANDO: funções para conversão de json

class UserDTO {
  String? name;
  UserTypeEnum? type;

  UserDTO({
    this.name,
    this.type,
  });
}

enum UserTypeEnum {
  @JsonValue('SECRETARIA')
  secretaria,
  @JsonValue('PROFESSOR')
  professor,
  @JsonValue('ALUNO')
  aluno,
}