import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/init/init_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/init/init_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/main_screen/main_screen_event.dart';

import 'blocs/login_bloc/login_event.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(create: (context) => InitBloc()..add(StartAppEvent())),
  BlocProvider(create: (context) => LoginBloc()..add(LoginStartEvent())),
  BlocProvider(create: (context) => MainScreenBloc()..add(MainScreenStartEvent()))
];
