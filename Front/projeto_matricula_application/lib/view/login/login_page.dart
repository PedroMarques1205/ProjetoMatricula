import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:projeto_matricula_application/infra/routes/router.dart';
import 'package:projeto_matricula_application/viewmodel/blocs.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_state.dart';

import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NavigationService>(
            create: (context) => NavigationService(),
          ),
        ],
        child: MultiBlocProvider(
          providers: blocProviders,
          child: Builder(
            builder: (context) {
              final navigator = NavigationService.of(context);
              return MaterialApp(
                navigatorKey: appNavigatorKey,
                onGenerateRoute: navigator.onGenerateRoute,
                builder: (_, child) {
                  return Scaffold(
                      appBar: AppBar(title: const Text("Test")),
                      body: BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoggedInState) {
                            // ir para a home com usuário atual já definido no sistema
                          }
                          if (state is LoginErrorState) {
                            // exibir mensagem de erro no login
                          }
                        },
                        builder: (context, state) {
                          return Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                              child: const Text("PressMe"),
                            ),
                          );
                        },
                      ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
