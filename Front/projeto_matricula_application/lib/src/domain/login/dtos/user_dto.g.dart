// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      nome: json['nome'] as String?,
      senha: json['senha'] as String?,
      tipoAcesso:
          $enumDecodeNullable(_$UserTypeEnumEnumMap, json['tipoAcesso']),
      ativo: json['ativo'] as bool?,
      matricula: json['matricula'] as String?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'nome': instance.nome,
      'senha': instance.senha,
      'tipoAcesso': _$UserTypeEnumEnumMap[instance.tipoAcesso],
      'ativo': instance.ativo,
      'matricula': instance.matricula,
    };

const _$UserTypeEnumEnumMap = {
  UserTypeEnum.Secretaria: 'SECRETARIA',
  UserTypeEnum.Professor: 'PROFESSOR',
  UserTypeEnum.Aluno: 'ALUNO',
};
