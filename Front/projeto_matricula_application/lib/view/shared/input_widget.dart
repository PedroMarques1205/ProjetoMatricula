import 'package:flutter/material.dart';
import 'package:projeto_matricula_application/design/colors/project_colors.dart';

class InputWidget extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  InputWidget({
    Key? key,
    required this.title,
    required this.onChanged,
    this.hintText, this.controller,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    controller.addListener(() {
      widget.onChanged(controller.text);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ProjectColors.buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText ?? 'Informe um valor...',
              hintStyle: TextStyle(color: Colors.grey[400]),
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
