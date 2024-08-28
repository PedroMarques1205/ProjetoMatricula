// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDTO _$CourseDTOFromJson(Map<String, dynamic> json) => CourseDTO(
      id: json['id'] as String?,
      nome: json['nome'] as String?,
      descricao: json['descricao'] as String?,
      ativo: json['ativo'] as bool?,
      numSemestres: (json['numSemestres'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CourseDTOToJson(CourseDTO instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'ativo': instance.ativo,
      'numSemestres': instance.numSemestres,
    };
