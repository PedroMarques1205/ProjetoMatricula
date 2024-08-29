import 'package:flutter/material.dart';

class CuriosidadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integrantes do Grupo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: [
            _buildMemberCard(
              imagePath: 'assets/images/member1.jpg',
              name: 'Lúcio Alves',
            ),
            _buildMemberCard(
              imagePath: 'assets/images/member2.jpg',
              name: 'Pedro Henrique',
            ),
            _buildMemberCard(
              imagePath: 'assets/images/member3.jpg',
              name: 'Juliana Parreiras',
            ),
            _buildMemberCard(
              imagePath: 'assets/images/member4.jpg',
              name: 'Luidi Cadete',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCard({required String imagePath, required String name}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 18),
          Text(
            name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
