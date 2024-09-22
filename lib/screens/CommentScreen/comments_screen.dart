import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/Components/comment_box.dart';
import 'package:pingo_learn_assignment/Components/plHeadingText.dart';
import 'package:pingo_learn_assignment/constants/colors.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/strings.dart';
import 'package:pingo_learn_assignment/screens/CommentScreen/comment_screen_provider.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CommentsProvider>(context, listen: false).getComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: PLDimens.pl100,
          backgroundColor: plPrimary,
          title: PLHeadingText(
            heading: PLString.commentsHeading,
            color: Colors.white,
          ),
          // automaticallyImplyLeading: false,
        ),
        body: Consumer<CommentsProvider>(
          builder: (context, value, child) {
            if (value.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: value.comments.length,
                itemBuilder: (context, index) {
                  return CommentsBox(
                      name: value.comments[index].name,
                      email: value.comments[index].email,
                      comment: value.comments[index].body);
                },
              );
            }
          },
        ));
  }
}
