import 'package:equatable/equatable.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_with_subjects_dto.dart';

abstract class RegisterCoursePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterCoursePageStart extends RegisterCoursePageEvent {}

class RegisterCoursePageGetInfoEvent extends RegisterCoursePageEvent {}

class RegisterNewCourseEvent extends RegisterCoursePageEvent {
  final CourseDTO course;
  final List<SubjectsSemester> subjects;

  RegisterNewCourseEvent({required this.subjects, required this.course});

  @override
  List<Object?> get props => [course];
}
