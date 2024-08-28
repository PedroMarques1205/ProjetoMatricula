// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectDTO _$SubjectDTOFromJson(Map<String, dynamic> json) => SubjectDTO(
      name: json['name'] as String?,
      hours: (json['hours'] as num?)?.toInt(),
      numberStudents: (json['numberStudents'] as num?)?.toInt(),
      shift: $enumDecodeNullable(_$SubjectShiftEnumEnumMap, json['shift']),
    );

Map<String, dynamic> _$SubjectDTOToJson(SubjectDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hours': instance.hours,
      'numberStudents': instance.numberStudents,
      'shift': _$SubjectShiftEnumEnumMap[instance.shift],
    };

const _$SubjectShiftEnumEnumMap = {
  SubjectShiftEnum.manha: 'MANHA',
  SubjectShiftEnum.noite: 'NOITE',
};
