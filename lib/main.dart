import 'package:flutter/material.dart';
import 'package:pingo_learn_assignment/constants/colors.dart';
import 'package:pingo_learn_assignment/constants/fonts.dart';
import 'package:pingo_learn_assignment/constants/strings.dart';
import 'package:pingo_learn_assignment/screens/CommentScreen/comment_screen_provider.dart';
import 'package:pingo_learn_assignment/screens/authenticaion/authenticaion_provider.dart';
import 'package:pingo_learn_assignment/screens/authenticaion/login_screen.dart';
import 'package:pingo_learn_assignment/screens/authenticaion/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CommentsProvider()),
          ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ],

        child: MaterialApp(
          title: PLString.commentsHeading,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: plPrimary),
              useMaterial3: true,
              fontFamily: PlFonts.poppins),
          home: const Signup(),
        ));
  }
}
