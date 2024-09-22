import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pingo_learn_assignment/Components/plButton.dart';
import 'package:pingo_learn_assignment/Components/plHeadingText.dart';
import 'package:pingo_learn_assignment/Components/plText.dart';
import 'package:pingo_learn_assignment/Components/plTextField.dart';
import 'package:pingo_learn_assignment/Utils/field_validation.dart';
import 'package:pingo_learn_assignment/constants/colors.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/strings.dart';
import 'package:pingo_learn_assignment/screens/CommentScreen/comments_screen.dart';
import 'package:pingo_learn_assignment/screens/authenticaion/signup_screen.dart';
import 'package:provider/provider.dart';
import 'authenticaion_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  void showError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: plPrimary,
        textColor: Colors.white,
        fontSize: PLDimens.pl12);
  }

  void _navigateIfNeeded() {
    final provider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    if (provider.isLoggedIn == true) {
      loginUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: PLDimens.pl16, vertical: PLDimens.pl40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PLHeadingText(
              heading: PLString.commentsHeading,
              color: plPrimary,
            ),
            const Spacer(),
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
                  return const Center(child: CircularProgressIndicator());
                } else if (value.loginError.isNotEmpty) {
                  showError(value.loginError);
                }
                return PLButton(
                    buttonLabel: PLString.login,
                    action: () {
                      if (FieldValidation.checkCredentials(
                          email: emailController.value.text,
                          password: passwordController.value.text)) {
                        value.loginUser(emailController.value.text,
                            passwordController.value.text);
                        // loginUser();
                      }
                      ;
                    });
              },
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: PLDimens.pl30, top: PLDimens.pl10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PLText(text: PLString.newUser, color: plSecondary),
                  InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: SizedBox(
                        height: PLDimens.pl44,
                        width: PLDimens.pl64,
                        child: PLHeadingText(
                            heading: PLString.signup, color: plPrimary),
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
