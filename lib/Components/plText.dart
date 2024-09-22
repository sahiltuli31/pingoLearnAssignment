import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/fonts.dart';

class PLText extends StatelessWidget {
  final String text;
  final Color color;
  const PLText ({super.key, required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: PLDimens.pl4),
      child: Text(text,
        style: TextStyle(color: color,fontFamily: PlFonts.poppins,fontWeight: FontWeight.w400),
      ),
    );
  }
}
