import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';
import 'package:projeto_matricula_application/view/login/login_page.dart';

class CuriosidadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.white,
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ProjectColors.primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Equipe, ',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey[700],
                        ),
                        children: const [
                          TextSpan(
                            text: 'PRU MINAS',
                            style: TextStyle(
                              color: ProjectColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '.\nProjeto desenvolvido para a matéria de Laboratório de Projeto de Software.',
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: _members.length,
                itemBuilder: (context, index) {
                  final member = _members[index];
                  return _buildMemberCard(
                    imagePath: member['imagePath']!,
                    name: member['name']!,
                  );
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildMemberCard({required String imagePath, required String name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ProjectColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  final List<Map<String, String>> _members = [
    {'imagePath': 'assets/images/member1.jpg', 'name': 'Lúcio Alves'},
    {'imagePath': 'assets/images/member2.jpg', 'name': 'Pedro Henrique'},
    {'imagePath': 'assets/images/julianaMember.jpeg', 'name': 'Juliana Parreiras'},
    {'imagePath': 'assets/images/member4.jpg', 'name': 'Luidi Cadete'},
  ];
}
