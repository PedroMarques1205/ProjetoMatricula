import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/infra/routes/router.dart';
import 'package:projeto_matricula_application/viewmodel/blocs.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/login_bloc/login_state.dart';

import '../main_screen/main_screen.dart';
import './curiosidade_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  String code = '';
  String password = '';

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
                      shadowColor: ProjectColors.primaryColor,
                      backgroundColor: ProjectColors.primaryColor,
                      surfaceTintColor: ProjectColors.primaryColor,
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.info, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CuriosidadePage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    body: BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoggedInState) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()),
                            (route) => false,
                          );
                        } else if (state is LoginErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                      },
                      builder: (context, state) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: ProjectColors.primaryColor,
                            child: ListView(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 85,
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/pruMinasSymbol.png',
                                          width: 250,
                                          height: 250,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            controller: codeController,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Código',
                                                hintStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255,
                                                        204,
                                                        156,
                                                        156))),
                                            onChanged: (value) {
                                              code = value;
                                            },
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                            controller: passwordController,
                                            obscureText: true,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Senha',
                                                hintStyle: TextStyle(
                                                    color: ProjectColors
                                                        .textLight)),
                                            onChanged: (value) {
                                              password = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Esqueceu sua senha?',
                                          style: TextStyle(
                                              color: ProjectColors.textLight),
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
                                        child: state is LoginLoadingState
                                            ? const CircularProgressIndicator()
                                            : const Text(
                                                'Login',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 124, 52, 47),
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
                                )
                              ],
                            ));
                      },
                    )),
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _doLogin(BuildContext context) {
    BlocProvider.of<LoginBloc>(context)
        .add(LoginButtonPressed(code: code, passwoard: password));
  }
}