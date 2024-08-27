import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final void Function(String value) onChanged;

  InputWidget({super.key, required this.title, required this.onChanged});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: Text(
            title,
            style:
                TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: ProjectColors.buttonColor,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle:
                    TextStyle(color: Color.fromARGB(255, 204, 156, 156))),
            onChanged: (value) {},
          ),
        )
      ],
    );
  }
}
