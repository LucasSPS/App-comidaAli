import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isLatLongSet(LatLng? latlng) {
  LatLng zeroLatLng = new LatLng(0, 0);

  return (latlng != zeroLatLng);

  /// Verifica se a lat e lng são diferentes de 0,0, ou seja, setadas
}

bool? isValidNumber(String? cost) {
  final regex = RegExp(r'^\d{1,3}(\.\d{3})*(,\d{2})?$');

  try {
    if (regex.hasMatch(cost!)) {
      double valorConvertido = double.parse(cost.replaceAll(',', '.'));
      if (valorConvertido > 0) {
        return true;
      }
    }
    return false;
  } catch (e) {
    return false;
  }
}

double convertStringToDouble(String valor) {
  String valorSemPonto = valor.replaceAll('.', '');

  String valorDecimal = valorSemPonto.replaceAll(',', '.');

  double valorConvertido = double.parse(valorDecimal);

  return valorConvertido;
}

String convertDoubleToString(double cost) {
  String valorConvertido = cost.toString().replaceAll('.', ',');

  return valorConvertido;
}

String convertLatLngToString(LatLng? varLatLng) {
  if (varLatLng == null) {
    return 'Erro';
  }
  return '${varLatLng.latitude},${varLatLng.longitude}';
}

List<AdsRecord>? ordenateList(
  List<AdsRecord>? defaultList,
  dynamic sort,
) {
  print("sort");
  return defaultList;
}

List<String>? sortByCategorie(
  List<AdsRecord>? adsDefault,
  List<String>? categoriesList,
) {
  List<String> lista1 = [];
  // loop in a list<AdsRecord> and take values
  if (adsDefault == null || adsDefault.isEmpty) {
    return [];
  }

  for (AdsRecord ad in adsDefault) {
    //filtrar se alguma categoria foi escolhida
    if (categoriesList!.any((category) => ad.categorie == category)) {
      lista1.add(ad.title);
    }
  }

  return lista1;
}

String isNullOrEmpty(List<AdsRecord>? adsFiltered) {
  // receive adsFiltered, if it is null return string null, if is empty return string empty
  if (adsFiltered == null) {
    return 'null';
  } else if (adsFiltered.isEmpty) {
    return 'empty';
  } else {
    return 'ok';
  }
}

String moneyFormat(double price) {
  // receive a price in double format and return a string with R$ + price in this format ###,###.00
  final format = NumberFormat("#,##0.00", "pt_BR");
  return "R\$ ${format.format(price)}";
}

bool isEmptyQuantity(
  int defaultQuantity,
  double valueDecrese,
) {
  if (defaultQuantity - valueDecrese == 0) {
    return true;
  } else {
    return false;
  }
}
