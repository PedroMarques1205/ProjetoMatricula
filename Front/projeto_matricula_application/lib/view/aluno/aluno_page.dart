import 'package:flutter/material.dart';

class Subject {
  final String name;
  final bool isOpen;

  Subject({required this.name, required this.isOpen});
}

class AlunoPage extends StatefulWidget {
  @override
  _AlunoPageState createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  int selectedIndex = 0;
  final String studentName = 'João Silva'; //aluno da matricula
  int enrolledSubjects = 3; //materias dele

  final List<Subject> mandatorySubjects = [ //implementar a logica do back
    Subject(name: 'Matemática', isOpen: true),
    Subject(name: 'História', isOpen: false),
    Subject(name: 'Química', isOpen: true),
  ];

  final List<Subject> electiveSubjects = [
    Subject(name: 'Filosofia', isOpen: true),
    Subject(name: 'Artes', isOpen: false),
    Subject(name: 'Música', isOpen: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciamento de Matrícula'),
        backgroundColor: const Color.fromARGB(255, 80, 80, 80),
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: const Color.fromARGB(255, 92, 24, 33),
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.book),
                selectedIcon: Icon(Icons.book, color: Colors.red),
                label: Text('Matrícula Obrigatória'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark),
                selectedIcon: Icon(Icons.bookmark, color: Colors.red),
                label: Text('Matrícula Optativa'),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho 
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '$studentName - Matérias Matriculadas: $enrolledSubjects',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: selectedIndex == 0
                        ? _buildSubjectList(mandatorySubjects)
                        : _buildSubjectList(electiveSubjects),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectList(List<Subject> subjects) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(0), 
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: subjects[index].isOpen
                            ? Colors.green
                            : Colors.red, 
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      subjects[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      subjects[index].isOpen ? 'Aberta' : 'Fechada',
                      style: TextStyle(
                        color: subjects[index].isOpen ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: subjects[index].isOpen ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 92, 24, 33),
                  ),
                  child: const Text('Se inscrever'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
