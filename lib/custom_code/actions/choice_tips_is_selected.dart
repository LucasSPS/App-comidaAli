// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> choiceTipsIsSelected(String? choiceTips) async {
  // check if variable "choiceTips" are empty, if true return false
  bool isValid = true;

  if (choiceTips == null) {
    isValid = false;
  }

  return isValid;
}
