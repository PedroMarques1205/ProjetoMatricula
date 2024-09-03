// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_wrapper_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseWithSubjectsWrapper _$CourseWithSubjectsWrapperFromJson(
        Map<String, dynamic> json) =>
    CourseWithSubjectsWrapper(
      course: CourseDTO.fromJson(json['course'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectsSemester.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseWithSubjectsWrapperToJson(
        CourseWithSubjectsWrapper instance) =>
    <String, dynamic>{
      'course': instance.course,
      'subjects': instance.subjects,
    };
