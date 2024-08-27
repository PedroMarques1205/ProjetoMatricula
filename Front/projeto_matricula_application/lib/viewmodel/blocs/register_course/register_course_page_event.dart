import 'package:equatable/equatable.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';

abstract class RegisterCoursePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterCoursePageStart extends RegisterCoursePageEvent {}

class RegisterCoursePageGetInfoEvent extends RegisterCoursePageEvent {}

class RegisterNewCourseEvent extends RegisterCoursePageEvent {
  final CourseDTO course;

  RegisterNewCourseEvent({required this.course});

  @override
  List<Object?> get props => [course];
}
