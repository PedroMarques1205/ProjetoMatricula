import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final Color? backgroundColor;
  final Color? textColor;
  final HeroIcons? icon;
  final double? radius;
  final bool? centerTitle;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      this.backgroundColor,
      this.textColor,
      this.icon,
      this.radius,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
          alignment: Alignment.center,
          width: width,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(radius ?? 10)),
          child: Row(
            mainAxisAlignment: centerTitle == true
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: centerTitle == true
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              icon != null
                  ? HeroIcon(
                      icon!,
                      color: Colors.grey[600],
                    )
                  : Container(),
              const SizedBox(
                width: 5,
              ),
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
