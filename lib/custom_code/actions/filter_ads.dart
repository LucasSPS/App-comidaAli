// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<AdsRecord>?> filterAds(
  String adType,
  String orderBy,
  List<String>? categoriesList,
  List<AdsRecord>? adsDefault,
) async {
  List<AdsRecord>? adsFiltered = [];

  if (adType == 'convertToNull') {
    return null;
  }

  if (adsDefault == null || adsDefault.isEmpty) {
    return [];
  }

  adsFiltered = adsDefault.where((ad) {
    if (adType == 'Pagos' && ad.isDonation) {
      return false;
    }
    if (adType == 'Doações' && !ad.isDonation) {
      return false;
    }
    if (categoriesList != null &&
        categoriesList.isNotEmpty &&
        !categoriesList.contains(ad.categorie)) {
      return false;
    }
    return true;
  }).toList();

  if (adsFiltered.isNotEmpty) {
    if (orderBy == "Novidades") {
      adsFiltered.sort((a, b) => b.createdTime!.compareTo(a.createdTime!));
    } else if (orderBy == "Vencimento Prox.") {
      adsFiltered
          .sort((a, b) => a.expirationDate!.compareTo(b.expirationDate!));
    } else if (orderBy == "Vencimento Dist.") {
      adsFiltered
          .sort((a, b) => b.expirationDate!.compareTo(a.expirationDate!));
    }
  }

  return adsFiltered;
}
