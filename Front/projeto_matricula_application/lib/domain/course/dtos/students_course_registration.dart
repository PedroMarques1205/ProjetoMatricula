import 'package:json_annotation/json_annotation.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/login/dtos/user_dto.dart';

part 'students_course_registration.g.dart';

@JsonSerializable()
class StudentsCourseRegistration {
  int? id;
  UserDTO? user;
  CourseDTO? course;

  StudentsCourseRegistration({
    this.id,
    this.user,
    this.course,
  });

  factory StudentsCourseRegistration.fromJson(Map<String, dynamic> json) =>
      _$StudentsCourseRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$StudentsCourseRegistrationToJson(this);
}
