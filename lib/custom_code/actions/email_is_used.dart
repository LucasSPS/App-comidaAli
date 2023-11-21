// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';
import '../../flutter_flow/custom_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool emailIsUsed(
  List<UsersRecord> listUsers,
  String? email,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // check if email is empty, bfore check if email entry exists in users
  if (email == null || email.isEmpty) {
    return true;
  }

  for (var user in listUsers) {
    if (user.email == email) {
      return true;
    }
  }
  return false;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
