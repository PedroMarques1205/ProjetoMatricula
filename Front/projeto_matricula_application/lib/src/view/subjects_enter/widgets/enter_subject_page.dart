import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';
import 'package:projeto_matricula_application/view/shared/input_widget.dart';
import 'package:projeto_matricula_application/view/subjects_list/subjects_list_page.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_bloc.dart';
import 'package:projeto_matricula_application/viewmodel/blocs/subjects_list_page/register_subjects_event.dart';

class NewSubjectPage extends StatefulWidget {
  final RegisterSubjectsBloc bloc;

  const NewSubjectPage({super.key, required this.bloc});

  @override
  State<NewSubjectPage> createState() => _NewSubjectPageWidgetState();
}

class _NewSubjectPageWidgetState extends State<NewSubjectPage> {
  late SubjectDTO newSubject;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    newSubject = SubjectDTO();
  }

  void _handleSave() async {
    if (newSubject.nome == null || newSubject.descricao == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      widget.bloc.add(CreateNewSubjectsEvent(subject: newSubject));
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SubjectsListPage()),
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ocorreu um erro ao salvar a disciplina')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Nova Disciplina',
          style:
              TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ProjectColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SubjectsListPage()),
              (route) => false,
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SubjectsListPage()),
                (route) => false,
              );
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: ProjectColors.primaryColor),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: InputWidget(
                          title: 'Nome',
                          onChanged: (value) {
                            setState(() {
                              newSubject.nome = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: InputWidget(
                          title: 'Descrição',
                          onChanged: (value) {
                            setState(() {
                              newSubject.descricao = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: InputWidget(
                          title: 'Turno',
                          onChanged: (value) {},
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 15),
                        child: Row(
                          children: [
                            const Expanded(child: Text('Ativo')),
                            Switch(
                              value: newSubject.ativa ?? true,
                              onChanged: (value) {
                                setState(() {
                                  newSubject.ativa = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ButtonWidget(
                          text: 'Salvar',
                          onPressed: _handleSave,
                          width: 345,
                          backgroundColor: ProjectColors.primaryLight,
                          textColor: Colors.white,
                          centerTitle: true,
                          radius: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
