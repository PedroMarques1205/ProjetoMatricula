import 'package:flutter/material.dart';
import '../professor/professor_page.dart'; 
import '../secretaria/secretaria_page.dart'; 
import '../aluno/aluno_page.dart'; 

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
        backgroundColor: Color.fromARGB(255, 92, 24, 33), 
        foregroundColor: Colors.white, 
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, 
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
