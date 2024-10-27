// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_with_subjects_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsSemester _$SubjectsSemesterFromJson(Map<String, dynamic> json) =>
    SubjectsSemester(
      idDisciplina: (json['idDisciplina'] as num?)?.toInt(),
      ordinalSemestre: (json['ordinalSemestre'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubjectsSemesterToJson(SubjectsSemester instance) =>
    <String, dynamic>{
      'idDisciplina': instance.idDisciplina,
      'ordinalSemestre': instance.ordinalSemestre,
    };
