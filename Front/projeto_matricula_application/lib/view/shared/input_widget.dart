import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';

class InputWidget extends StatelessWidget {
  final String title;
  final String? hintText;
  final void Function(String value) onChanged;

  InputWidget({super.key, required this.title, required this.onChanged, this.hintText});

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
            style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: ProjectColors.buttonColor,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText ?? 'Informe um valor...',
                hintStyle: TextStyle(color: Colors.grey[400])),
            onChanged: (value) {},
          ),
        )
      ],
    );
  }
}
