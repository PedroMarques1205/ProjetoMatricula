// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_subjects_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseSubjectsDTO _$CourseSubjectsDTOFromJson(Map<String, dynamic> json) =>
    CourseSubjectsDTO(
      id: (json['id'] as num?)?.toInt(),
      disciplina: json['disciplina'] == null
          ? null
          : SubjectDTO.fromJson(json['disciplina'] as Map<String, dynamic>),
      curso: json['curso'] == null
          ? null
          : CourseDTO.fromJson(json['curso'] as Map<String, dynamic>),
      semestre: json['semestre'] == null
          ? null
          : SemesterDTO.fromJson(json['semestre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseSubjectsDTOToJson(CourseSubjectsDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'disciplina': instance.disciplina,
      'curso': instance.curso,
      'semestre': instance.semestre,
    };
