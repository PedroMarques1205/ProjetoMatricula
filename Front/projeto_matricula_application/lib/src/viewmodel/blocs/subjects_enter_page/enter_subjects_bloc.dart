import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/course/course_service.dart';
import 'package:projeto_matricula_application/domain/course/dtos/course_subjects_dto.dart';
import 'package:projeto_matricula_application/domain/student/student_service.dart';
import 'package:projeto_matricula_application/domain/subjects/subject_service.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_enter_page/enter_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_enter_page/enter_subjects_state.dart';

class EnterSubjectsBloc extends Bloc<EnterSubjectsEvent, EnterSubjectsState> {
  final SubjectService service = SubjectService();
  final StudentService studentService = StudentService();
  final CourseService courseService = CourseService();

  EnterSubjectsBloc() : super(EnterSubjectsInitState()) {
    on<ListSubjectsEvent>(_onList);
    on<CreateNewSubjectsEvent>(_onCreate);
    on<AssociateSubjectEvent>(_onAssociate);
    on<AssociateProfessorEvent>(_onAssociateProfessor);
    on<ProfessorIdChanged>(_onProfessorIdChanged);
    on<ReloadingRegisterPageEvent>(_onReload);
  }

  Future<void> _onCreate(
      CreateNewSubjectsEvent event, Emitter<EnterSubjectsState> emit) async {
    await service.createSubject(event.subject);
  }

  Future<void> _onReload(ReloadingRegisterPageEvent event,
      Emitter<EnterSubjectsState> emit) async {
    try {
      var allSubjects = await service.listSubjects();
      var course =
          await courseService.getCourseById(Context.currentUser.matricula!);
      var mySubjects =
          await service.listStudentsSubjects(Context.currentUser.matricula!);

      if (course.nome != null) {
        var courseSubjects = await courseService.listCousesSubjects(course.id!);
        var filteredCourseSubjects = <CourseSubjectsDTO>[];

        for (final courseSubject in courseSubjects) {
          var index = mySubjects.indexWhere(
              (mySubject) => mySubject.id == courseSubject.disciplina!.id);

          if (index < 0) {
            filteredCourseSubjects.add(courseSubject);
          }
        }

        emit(SubjectListLoadedState(
          subjects: allSubjects,
          course: course,
          mySubjects: mySubjects,
          otherSubjects: filteredCourseSubjects,
        ));
      } else {
        emit(SubjectListLoadingErrorState());
      }
    } catch (e) {
      print('Error: $e');
      emit(SubjectListLoadingErrorState());
    }
  }

  Future<void> _onList(
      ListSubjectsEvent event, Emitter<EnterSubjectsState> emit) async {
    try {
      var allSubjects = await service.listSubjects();
      var course =
          await courseService.getCourseById(Context.currentUser.matricula!);
      var mySubjects =
          await service.listStudentsSubjects(Context.currentUser.matricula!);

      if (course.nome != null) {
        var courseSubjects = await courseService.listCousesSubjects(course.id!);
        var filteredCourseSubjects = <CourseSubjectsDTO>[];

        for (final courseSubject in courseSubjects) {
          var index = mySubjects.indexWhere(
              (mySubject) => mySubject.id == courseSubject.disciplina!.id);

          if (index < 0) {
            filteredCourseSubjects.add(courseSubject);
          }
        }

        emit(SubjectListLoadedState(
          subjects: allSubjects,
          course: course,
          mySubjects: mySubjects,
          otherSubjects: filteredCourseSubjects,
        ));
      } else {
        emit(SubjectListLoadingErrorState());
      }
    } catch (e) {
      print('Error: $e');
      emit(SubjectListLoadingErrorState());
    }
  }

  Future<void> _onAssociate(
      AssociateSubjectEvent event, Emitter<EnterSubjectsState> emit) async {
    if (event.subject.nome != null && event.matricula.isNotEmpty) {
      await service.associateSubject(event.matricula, event.subject.nome!);
      emit(ReloadingRegisterPageState());
    } else {
      print('Nome da disciplina ou matrícula está vazio');
    }
  }

  Future<void> _onProfessorIdChanged(
      ProfessorIdChanged event, Emitter<EnterSubjectsState> emit) async {
    emit(EnterSubjectsWithProfessorIdState(professorId: event.professorId));
  }

  Future<void> _onAssociateProfessor(
      AssociateProfessorEvent event, Emitter<EnterSubjectsState> emit) async {
    try {
      await service.associateProfessor(event.professorId, event.subjectName);
      emit(AssociationSuccessState());
    } catch (e) {
      emit(AssociationErrorState(message: e.toString()));
    }
  }
}
