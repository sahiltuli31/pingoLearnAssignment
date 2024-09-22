import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingo_learn_assignment/constants/strings.dart';

class AuthenticationProvider extends ChangeNotifier {
  var isLoggedIn = false;
  var email = "";
  var password = "";
  var isLoading = false;
  var signUpError = "";
  var loginError = "";

  void resetAllValues() {
    isLoggedIn = false;
    email = "";
    password = "";
    isLoading = false;
    signUpError = "";
    loginError = "";
  }

  Future<void> signUpUser(String email, String password, String name) async {
    resetAllValues();
    isLoading = true;

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Got credss $credential");

      isLoggedIn = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        signUpError = PLString.weakPassword;
      } else if (e.code == 'email-already-in-use') {
        signUpError = PLString.accountAlreadyPresent;
      } else {
        signUpError = PLString.signupError;
      }
    } catch (e) {
      signUpError = PLString.signupError;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> loginUser(String email, String password) async {
    resetAllValues();
    isLoading = true;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      isLoggedIn = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        loginError = PLString.userNotFound;
      } else if (e.code == 'wrong-password') {
        loginError = PLString.wrongPassword;
      } else {

        loginError = PLString.wrongCreds;
      }
    }
    isLoading = false;

    notifyListeners();
  }
}
