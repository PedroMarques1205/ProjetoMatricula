// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherDTO _$TeacherDTOFromJson(Map<String, dynamic> json) => TeacherDTO(
      matricula: json['matricula'] as String?,
      nome: json['nome'] as String?,
      senha: json['senha'] as String?,
      tipoAcesso: json['tipoAcesso'] as String?,
      ativo: json['ativo'] as bool?,
    );

Map<String, dynamic> _$TeacherDTOToJson(TeacherDTO instance) =>
    <String, dynamic>{
      'id': instance.matricula,
      'nome': instance.nome,
      'senha': instance.senha,
      'tipoAcesso': instance.tipoAcesso,
      'ativa': instance.ativo,
    };

//     "senha": "string",
//     "tipoAcesso": "ALUNO",

