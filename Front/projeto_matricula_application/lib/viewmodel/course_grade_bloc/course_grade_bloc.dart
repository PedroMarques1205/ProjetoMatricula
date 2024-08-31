import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/course/course_service.dart';
import 'package:projeto_matricula_application/viewmodel/course_grade_bloc/course_grade_event.dart';
import 'package:projeto_matricula_application/viewmodel/course_grade_bloc/course_grade_state.dart';

class CourseGradeBloc extends Bloc<CourseGradeEvent, CourseGradeState> {
  final CourseService service = CourseService();

  CourseGradeBloc() : super(CourseGradeInitState()) {
    on<CourseGradeListEvent>(_onList);
  }

  Future<void> _onList(CourseGradeListEvent event, Emitter<CourseGradeState> emit) async {
    var course = await service.getCourseById(Context.currentUser.matricula!);

    if (course.id == null) {
      emit(LoadCourseErrorState());
    } else {
      var coursesSubjects = await service.listCousesSubjects(course.id!);
      emit(CourseGradeLoadedState(subjects: coursesSubjects, course: course));
    }
  }
}
