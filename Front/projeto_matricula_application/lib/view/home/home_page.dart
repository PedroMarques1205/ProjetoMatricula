import 'package:flutter/material.dart';
import '../professor/professor_page.dart'; // Importa a página ProfessorPage
import '../secretaria/secretaria_page.dart'; // Importa a página SecretariaPage
import '../aluno/aluno_page.dart'; // Importa a página AlunoPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pru Minas'),
        backgroundColor: Color.fromARGB(255, 80, 80, 80),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildButton(
              context,
              'Professor',
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfessorPage()),
              ),
            ),
            SizedBox(height: 16.0),
            _buildButton(
              context,
              'Secretaria',
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SecretariaPage()),
              ),
            ),
            SizedBox(height: 16.0),
            _buildButton(
              context,
              'Aluno',
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AlunoPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 92, 24, 33), // Fundo vermelho
        foregroundColor: Colors.white, // Texto branco
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Sem bordas arredondadas
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
