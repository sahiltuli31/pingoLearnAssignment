import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/Components/comment_box_text.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/text.dart';

class CommentsBox extends StatelessWidget {
  final String name;
  final String email;
  final String comment;
  const CommentsBox(
      {super.key,
      required this.name,
      required this.email,
      required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: PLDimens.pl150,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(PLDimens.pl8),
            child: Container(
              width: PLDimens.pl70,
              height: PLDimens.pl70,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Text(
                name[0].toUpperCase(),
                style:
                     TextStyle(fontSize: PLDimens.pl25, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(PLDimens.pl8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommentBoxText(label: PLTexts.name, text: name),
                  CommentBoxText(label: PLTexts.email, text: email),
                  Text(
                    comment,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
