import 'package:flutter/material.dart';
import '../home/home_page.dart'; // Importa a página HomePage

class Subject {
  final String name;
  final List<String> students;

  Subject({required this.name, required this.students});
}

class ProfessorPage extends StatefulWidget {
  @override
  _ProfessorPageState createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  final List<Subject> subjects = [
    Subject(name: 'Matemática', students: ['Aluno 1', 'Aluno 2', 'Aluno 3']),
    Subject(name: 'História', students: ['Aluno 4', 'Aluno 5']),
    Subject(name: 'Química', students: ['Aluno 6', 'Aluno 7', 'Aluno 8', 'Aluno 9']),
  ];

  Subject? selectedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de Matérias'),
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Pru Minas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Área de perfil no topo do Drawer
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Círculo cinza com ícone de perfil
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  // Nome do usuário
                  Text(
                    'Usuário',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Barra lateral com cor específica
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 92, 24, 33),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSubject = subjects[index];
                                  Navigator.of(context).pop(); // Fechar o drawer ao selecionar uma matéria
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
                                  borderRadius: BorderRadius.circular(8), // Canto quadrado com leve arredondamento
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Text(
                                    subjects[index].name,
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 255, 255, 255), // Texto branco
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Botão Voltar com fundo branco
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false, // Remove todas as rotas anteriores
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Fundo branco
                          foregroundColor: Colors.black, // Texto preto
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero, // Sem bordas arredondadas
                          ),
                        ),
                        child: Text('Voltar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          // Exibição dos alunos da matéria selecionada
          Expanded(
            child: selectedSubject == null
                ? Center(child: Text('Selecione uma matéria'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Alunos de ${selectedSubject!.name}:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: selectedSubject!.students.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(selectedSubject!.students[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
