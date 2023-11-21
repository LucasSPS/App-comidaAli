// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String?> authFlutterFire(
    String emailAddress,
    String password,
    String messageInvalidEmail,
    String messageWrongPassword,
    String messageUserNotFound) async {
  String returnAuth = "valid";

  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      returnAuth = 'No user found for that email.';
      return returnAuth;
    } else if (e.code == 'wrong-password') {
      returnAuth = 'Wrong password provided for that user.';
      return returnAuth;
    }
  }
  return returnAuth;
}
