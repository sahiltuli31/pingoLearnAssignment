import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/constants/colors.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/fonts.dart';

class PLTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const PLTextField({super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: PLDimens.pl50,
      margin: EdgeInsets.symmetric(vertical: PLDimens.pl8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PLDimens.pl8),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: PLDimens.pl8),
        child: TextField(
          controller: controller,
          style: TextStyle(fontWeight: FontWeight.w400, color: plSecondary),
          cursorColor: plPrimary,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: plSecondary,
              fontFamily: PlFonts.poppins,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
