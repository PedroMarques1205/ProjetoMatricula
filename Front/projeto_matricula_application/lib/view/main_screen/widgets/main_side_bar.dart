import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 164, 92, 92),
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: HeroIcon(
                      HeroIcons.user,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Juliana Parreiras',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(
                      'Aluno',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Teste'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Teste'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Teste'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
