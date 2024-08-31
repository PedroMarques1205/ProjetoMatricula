// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectDTO _$SubjectDTOFromJson(Map<String, dynamic> json) => SubjectDTO(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      descricao: json['descricao'] as String?,
      ativa: json['ativa'] as bool?,
    );

Map<String, dynamic> _$SubjectDTOToJson(SubjectDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'ativa': instance.ativa,
    };
