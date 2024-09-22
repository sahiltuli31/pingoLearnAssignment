import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pingo_learn_assignment/constants/colors.dart';
import 'package:pingo_learn_assignment/constants/dimensions.dart';
import 'package:pingo_learn_assignment/constants/strings.dart';

class FieldValidation {
  static void showError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: plPrimary,
        textColor: Colors.white,
        fontSize: PLDimens.pl12);
  }

  static bool checkCredentials({String? name, required String email, required String password}) {

    if(name != null) {
      final bool validName = RegExp(r'^[a-z]+$').hasMatch(name);
      if (!validName) {
        showError(PLString.invalidName);
        return false;
      }
    }
      final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

    if (!emailValid) {
      showError(PLString.invalidEmail);
      return false;
    }

    final bool passwordValid = password.length > 6;

    if (!passwordValid) {
      showError(PLString.invalidPassword);
      return false;
    }
    return true;
  }

  static String maskEmail(String email) {

    final parts = email.split('@');


    if (parts.length != 2) return email; // Return as is if it's not a valid email

    final localPart = parts[0];
    final domainPart = parts[1];


    if (localPart.length <= 3) {

      return email;
    } else {

      final maskedLocalPart = '${localPart.substring(0, 3)}${'*' * (localPart.length - 3)}';
      return '$maskedLocalPart@$domainPart';
    }
  }

}
