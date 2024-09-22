import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/Components/plHeadingText.dart';
import 'package:pingo_learn_assignment/constants/colors.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';

class PLButton extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback? action;
  const PLButton({super.key, required this.buttonLabel,required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: PLDimens.pl200,
            child: ElevatedButton(
              onPressed: () => {
                action?.call()
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PLDimens.pl10)),
                backgroundColor: plPrimary,
                padding:  EdgeInsets.symmetric(horizontal: PLDimens.pl10, vertical: PLDimens.pl12),
                alignment: Alignment.center,
                elevation: 1,
              ),
              child: PLHeadingText(
                heading: buttonLabel,
                color: plLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
