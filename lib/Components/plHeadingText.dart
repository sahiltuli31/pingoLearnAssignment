import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/fonts.dart';

class PLHeadingText extends StatelessWidget {
 final String heading;
 final  Color color;
   const PLHeadingText({super.key,required this.heading,required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: PLDimens.pl4),
      child: Text(heading,
      style: TextStyle(color: color,fontFamily: PlFonts.poppins,fontWeight: FontWeight.bold),
      ),
    );
  }
}
