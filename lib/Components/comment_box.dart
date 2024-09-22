import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/Components/comment_box_text.dart';
import 'package:pingo_learn_assignment/Utils/field_validation.dart';
import 'package:pingo_learn_assignment/Utils/firebase_config/firebase_remote_config_service.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/text.dart';

class CommentsBox extends StatefulWidget {
  final String name;
  final String email;
  final String comment;
  const CommentsBox(
      {super.key,
      required this.name,
      required this.email,
      required this.comment});

  @override
  State<CommentsBox> createState() => _CommentsBoxState();
}

class _CommentsBoxState extends State<CommentsBox> {
  final remoteConfig = FirebaseRemoteConfigService();
  String userEmail = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userEmail = widget.email;
    checkMask();
  }
  void checkMask(){
    String flag = remoteConfig.getString(FirebaseRemoteConfigKeys.emailMasking).toString();
    if(flag == 'true'){
      setState(() {
        userEmail = FieldValidation.maskEmail(widget.email);
      });
    }
  }
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
                widget.name[0].toUpperCase(),
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
                  CommentBoxText(label: PLTexts.name, text: widget.name),
                  CommentBoxText(label: PLTexts.email, text: userEmail),
                  Text(
                    widget.comment,
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
