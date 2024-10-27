// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemesterDTO _$SemesterDTOFromJson(Map<String, dynamic> json) => SemesterDTO(
      id: json['id'] == null
          ? null
          : SemestreId.fromJson(json['id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SemesterDTOToJson(SemesterDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

SemestreId _$SemestreIdFromJson(Map<String, dynamic> json) => SemestreId(
      ordinal: (json['ordinal'] as num?)?.toInt(),
      curso: json['curso'] == null
          ? null
          : CourseDTO.fromJson(json['curso'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SemestreIdToJson(SemestreId instance) =>
    <String, dynamic>{
      'ordinal': instance.ordinal,
      'curso': instance.curso,
    };
