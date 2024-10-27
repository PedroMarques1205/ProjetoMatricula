// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_course_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsCourseRegistration _$StudentsCourseRegistrationFromJson(
        Map<String, dynamic> json) =>
    StudentsCourseRegistration(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
      course: json['course'] == null
          ? null
          : CourseDTO.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentsCourseRegistrationToJson(
        StudentsCourseRegistration instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'course': instance.course,
    };
