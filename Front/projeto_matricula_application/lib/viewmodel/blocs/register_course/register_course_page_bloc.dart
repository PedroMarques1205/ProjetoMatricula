import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/course_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_state.dart';

class RegisterCoursePageBloc extends Bloc<RegisterCoursePageEvent, RegisterCoursePageState> {
  final CourseService _service = CourseService();

  RegisterCoursePageBloc() : super(RegisterCoursePageInitState()) {
    on<RegisterCoursePageStart>(_onStart);
    on<RegisterCoursePageGetInfoEvent>(_onGetInfo);
    on<RegisterNewCourseEvent>(_onNewCourse);
  }

  void _onStart(RegisterCoursePageStart event, Emitter<RegisterCoursePageState> emit) {
    emit(RegisterCoursePageStartState());
  }

  Future<void> _onGetInfo(RegisterCoursePageGetInfoEvent event, Emitter<RegisterCoursePageState> emit) async {
    var courses = await _service.listCourses();
    emit(RegisterCoursesListLoaded(courses: courses));
  }

  Future<void> _onNewCourse(RegisterNewCourseEvent event, Emitter<RegisterCoursePageState> emit) async {
    CourseDTO newCourse = CourseDTO(
      nome: event.course.nome,
      codigo: event.course.codigo,
      id: event.course.id,
      ativo: true,
    );

    var resp = await _service.createCourse(newCourse);

    if (resp?.codigo != null && resp!.codigo!.isNotEmpty) {
      emit(NewCourseRegisteredState(course: resp));
    } else {
      emit(NewCourseCreationErrorState());
    }
  }
}
