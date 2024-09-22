import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CommentBoxText extends StatelessWidget {
  final String label;
  final String text;
  const CommentBoxText({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(text: label, style: TextStyle(color: plDark)),
      TextSpan(
          text: text,
          style: TextStyle(fontWeight: FontWeight.w800, color: plSecondary))
    ]));
  }
}
