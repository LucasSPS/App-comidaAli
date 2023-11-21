// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<AdsRecord>?> searchAds(
  List<AdsRecord>? adsDefault,
  String? searchItem,
) async {
  List<AdsRecord>? adsFound = [];
  // check if adsDefault if null, and return null, is empty return []
  if (adsDefault == null || searchItem == '' || searchItem == null) {
    return null;
  } else if (adsDefault.isEmpty) {
    return [];
  } else {
    for (AdsRecord ad in adsDefault) {
      if (ad.title!.toUpperCase().contains(searchItem.toUpperCase())) {
        adsFound.add(ad);
      }
    }
  }
  return adsFound;
}
