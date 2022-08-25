import 'package:flutter/material.dart';

class MinorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;
  const MinorButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: size.width * 0.18,
          height: 34,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 15, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
