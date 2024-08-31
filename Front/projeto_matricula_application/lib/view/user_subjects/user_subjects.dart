import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/user_subjects/widgets/subject_item.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/user_subjects/user_subjects_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/user_subjects/user_subjects_event.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/user_subjects/user_subjects_state.dart';

class UserSubjects extends StatefulWidget {
  @override
  State<UserSubjects> createState() => UserSubjectsPageState();
}

class UserSubjectsPageState extends State<UserSubjects> {
  late UserSubjectsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = UserSubjectsBloc();
    _bloc.add(UserSubjectsStartEvent());
  }

  List<SubjectDTO> studentsSubjects = [];

  final List<List<Color>> gradients = [
    [Color(0xFFFFD1DC), Color(0xFFFFC0CB)],
    [Color(0xFFFFE4B5), Color(0xFFFFDAB9)],
    [Color(0xFFB0E0E6), Color(0xFFAFEEEE)],
    [Color(0xFFF0E68C), Color(0xFFFFFACD)],
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserSubjectsBloc, UserSubjectsState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is UserSubjectsLoadedState) {
            setState(() {
              studentsSubjects = state.subjects;
            });
          }
        },
        builder: (context, state) {
          if (state is UserSubjectsEmptyState) {
            return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Opa, ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey[700],
                        ),
                        children: [
                          TextSpan(
                            text: Context.current.nome,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text:
                                '!\nParece que você não está matriculado(a) em nenhuma disciplina :/',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Vá até o menu de matrículas na aba lateral e matricule-se já!',
                        style: TextStyle(color: Colors.grey[500], fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Image.asset(
                        'assets/images/idkicon2.png',
                        width: 150,
                        height: 150,
                      ),
                    )
                  ],
                ));
          }
          if (state is UserSubjectsLoadedState) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 340,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Pesquisar...',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: ProjectColors.buttonColor,
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25, top: 15, bottom: 15),
                        child: RichText(
                          text: TextSpan(
                            text: 'Olá, ',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey[700],
                            ),
                            children: [
                              TextSpan(
                                text: Context.current.nome,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: '!\nEssas são as suas matérias.',
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children:
                              List.generate(studentsSubjects.length, (index) {
                            final gradientColors =
                                gradients[index % gradients.length];
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: SubjectItem(
                                  subject: studentsSubjects[index],
                                  gradientColors: gradientColors,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: ProjectColors.primaryColor,
            ),
          );
        });
  }
}
