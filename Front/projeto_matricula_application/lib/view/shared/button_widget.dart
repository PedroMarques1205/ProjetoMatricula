import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final Color? backgroundColor;
  final Color? textColor;
  final HeroIcons icon;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      this.backgroundColor,
      this.textColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Container(
          alignment: Alignment.center,
          width: width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              HeroIcon(icon, color: Colors.grey[600],),
              const SizedBox(width: 5,),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? const Color.fromARGB(255, 124, 52, 47),
                ),
              ),
            ],
          )),
    );
  }
}
