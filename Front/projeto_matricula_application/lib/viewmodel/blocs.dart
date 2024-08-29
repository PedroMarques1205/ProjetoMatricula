import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/init/init_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/init/init_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_course/register_course_page_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/register_student/register_student_page_event.dart';

import 'blocs/login_bloc/login_event.dart';
import './blocs/register_teacher/register_teacher_page_bloc.dart';
import './blocs/register_teacher/register_teacher_page_event.dart';


List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => InitBloc()..add(StartAppEvent())),
  BlocProvider(create: (context) => LoginBloc()..add(LoginStartEvent())),
  BlocProvider(create: (context) => MainScreenBloc()..add(MainScreenStartEvent())),
  BlocProvider(create: (context) => RegisterStudentPageBloc()..add(RegisterStudentPageStart())),
  BlocProvider(create: (context) => RegisterTeacherPageBloc()..add(RegisterTeacherPageStart())),
  BlocProvider(create: (context) => RegisterCoursePageBloc()..add(RegisterCoursePageStart())),
<<<<<<< HEAD
 BlocProvider(create: (context) => EnterSubjectsBloc()..add(EnterSubjectsPageStart())),
  
=======
>>>>>>> 8f121bfc2ee39c487bb6fbacdd894d04b01f9628
];
