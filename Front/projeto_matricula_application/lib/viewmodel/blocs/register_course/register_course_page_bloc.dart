import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_dto.dart';
import 'package:projeto_matricula_application/domain/course/course_service.dart';
import 'package:projeto_matricula_application/domain/subjects/subject_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_state.dart';

class RegisterCoursePageBloc extends Bloc<RegisterCoursePageEvent, RegisterCoursePageState> {
  final CourseService _service = CourseService();
  final SubjectService _subjectService = SubjectService();

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
    var subjects = await _subjectService.listSubjects();
    emit(RegisterCoursesListLoaded(courses: courses, subjects: subjects));
  }

 Future<void> _onNewCourse(RegisterNewCourseEvent event, Emitter<RegisterCoursePageState> emit) async {
  CourseDTO newCourse = CourseDTO(
    nome: event.course.nome,
    descricao: event.course.descricao,
    id: event.course.id,
    ativo: event.course.ativo,
    numSemestres: event.course.numSemestres,
  );

  var resp = await _service.creatCourseWithSubject(newCourse, event.subjects);

  if (resp != null && resp.isNotEmpty && resp[0] != null && resp[0].curso != null) {
    emit(NewCourseRegisteredState(course: resp![0].curso!));
  } else {
    emit(NewCourseCreationErrorState());
  }
}
}
