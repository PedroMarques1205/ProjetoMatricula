import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:projeto_matricula_application/infra/routes/router.dart';
import 'package:projeto_matricula_application/viewmodel/blocs.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_state.dart';

import '../main_screen/main_screen.dart';
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
                      appBar: AppBar(
                        shadowColor: const Color.fromARGB(255, 124, 52, 47),
                        backgroundColor: const Color.fromARGB(255, 124, 52, 47),
                        surfaceTintColor:
                            const Color.fromARGB(255, 124, 52, 47),
                      ),
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
                          return Container(
                              color: const Color.fromARGB(255, 124, 52, 47),
                              child: Column(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/images/logo_chapeuzinho.png',
                                      width: 250,
                                      height: 250,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.person,
                                              color: Color.fromARGB(
                                                  255, 80, 78, 78))),
                                      Container(
                                        width: 300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Código',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 204, 156, 156))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 350,
                                    height: 10,
                                    child: Divider(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.lock,
                                              color: Color.fromARGB(
                                                  255, 80, 78, 78))),
                                      Container(
                                        width: 300,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        padding: const EdgeInsets.all(10),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Senha',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 204, 156, 156))),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Esqueceu sua senha?',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 204, 156, 156)),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () => _doLogin(context),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 300,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 124, 52, 47),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Registrar-se',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 204, 156, 156)),
                                      ))
                                ],
                              ));
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

  void _doLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()), // HomePage ou const MainScreen
      (route) => false,
    );
  }
}
