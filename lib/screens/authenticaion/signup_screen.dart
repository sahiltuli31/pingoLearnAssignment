import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/Components/plButton.dart';
import 'package:pingo_learn_assignment/Components/plHeadingText.dart';
import 'package:pingo_learn_assignment/Components/plText.dart';
import 'package:pingo_learn_assignment/Components/plTextField.dart';
import 'package:pingo_learn_assignment/Utils/field_validation.dart';
import 'package:pingo_learn_assignment/constants/colors.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/strings.dart';
import 'package:pingo_learn_assignment/screens/CommentScreen/comments_screen.dart';
import 'package:pingo_learn_assignment/screens/authenticaion/authenticaion_provider.dart';
import 'package:pingo_learn_assignment/screens/authenticaion/login_screen.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthenticationProvider>(context, listen: false)
        .addListener(_navigateIfNeeded);
  }

  @override
  void dispose() {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .removeListener(_navigateIfNeeded);
    super.dispose();
  }

  void loginUser() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CommentsScreen()));
  }

  void _navigateIfNeeded() {
    final provider = Provider.of<AuthenticationProvider>(context, listen: false);
    if (provider.isLoggedIn == true) {
      loginUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PLHeadingText(
              heading: PLString.commentsHeading,
              color: plPrimary,
            ),
            const Spacer(),
            PLTextField(
              hint: PLString.name,
              controller: nameController,
            ),
            PLTextField(
              hint: PLString.email,
              controller: emailController,
            ),
            PLTextField(
              hint: PLString.password,
              controller: passwordController,
            ),
            const Spacer(),
            Consumer<AuthenticationProvider>(
              builder: (context, value, child) {
                if (value.isLoading) {
                  return const CircularProgressIndicator();
                } else if (value.signUpError.isNotEmpty) {
                  FieldValidation.showError(value.signUpError);
                }
                return PLButton(
                    buttonLabel: PLString.signup,
                    action: () {
                      if (FieldValidation.checkCredentials(
                          email: emailController.value.text,
                          password: passwordController.value.text,
                          name: nameController.value.text)) {
                        value.signUpUser(
                            emailController.value.text,
                            passwordController.value.text,
                            nameController.value.text);
                      }
                      ;
                    });
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: PLDimens.pl30,top: PLDimens.pl10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PLText(text: PLString.existingUser, color: plSecondary),
                  InkWell(
                    highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: SizedBox(
                        height: PLDimens.pl44,
                        width: PLDimens.pl64,
                        child: PLHeadingText(
                            heading: PLString.login, color: plPrimary),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
