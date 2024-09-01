import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/view/aluno/aluno_page.dart';
import 'package:projeto_matricula_application/view/secretaria/secretaria_page.dart';
import '../professor/professor_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pru Minas'),
          backgroundColor: const Color.fromARGB(255, 80, 80, 80),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton(
                    context,
                    'Professor',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ClassProfessorPage()),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _buildButton(
                    context,
                    'Secretaria',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecretariaPage()),
                    ),
                  ),
                  const SizedBox(height: 16.0),
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
          ],
        ));
  }

  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 92, 24, 33),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
