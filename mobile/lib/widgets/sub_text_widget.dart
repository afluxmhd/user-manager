import 'package:flutter/material.dart';

class SubTextWidget extends StatelessWidget {
  const SubTextWidget({super.key, required this.title, this.fontSize = 16, this.color = Colors.white});

  final String title;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.w400));
  }
}
