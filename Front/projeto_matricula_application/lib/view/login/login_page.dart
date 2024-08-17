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
                home: Scaffold(
                  appBar: AppBar(
                    title: const Text("Login"),
                    backgroundColor: Color.fromARGB(255, 80, 80, 80),
                  ),
                  body: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoggedInState) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false,
                        );
                      }
                     //if (state is LoginErrorState) {
                        //ScaffoldMessenger.of(context).showSnackBar(
                          //SnackBar(content: Text('Erro de login: ${state.errorMessage}')),
                        //);
                      //}
                    },
                    builder: (context, state) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Campos de entrada de usuário e senha
                            TextField(
                              decoration: InputDecoration(labelText: 'Usuário'),
                            ),
                            TextField(
                              decoration: InputDecoration(labelText: 'Senha'),
                              obscureText: true,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Verifica credenciais e redireciona para a HomePage
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                  (route) => false,
                                );
                              },
                              child: const Text("Login"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
