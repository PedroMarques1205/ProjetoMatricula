import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:projeto_matricula_application/domain/context/context.dart';
import 'package:projeto_matricula_application/view/shared/button_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 164, 92, 92),
            ),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: HeroIcon(
                      HeroIcons.user,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${Context.current.nome}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      '${Context.current.tipoAcesso?.name}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.center,
              child: ButtonWidget(
                icon: HeroIcons.bookOpen,
                text: 'Matérias',
                width: 250,
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 234, 237, 237),
                textColor: Colors.grey[600],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.center,
              child: ButtonWidget(
                icon: HeroIcons.currencyDollar,
                text: 'Financeiro',
                width: 250,
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 234, 237, 237),
                textColor: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}
