// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert' show utf8;
import 'package:download/download.dart';

Future downloadCollectionAsCsv(List<AdsRecord>? myAds) async {
  myAds = myAds ?? [];

  String header =
      'title,categorie,quantity,visible,price,expirationDate,createdTime';
  // Add the company name and address as a header

  String fileContent = header;

  myAds.asMap().forEach((index, record) => fileContent = fileContent +
      "\n" +
      record.title.toString() +
      "," +
      record.categorie.toString() +
      "," +
      record.quantity.toString() +
      "," +
      record.visibleStatus.toString() +
      "," +
      record.price.toString() +
      "," +
      DateFormat('dd-MM-yyyy').format(record.expirationDate!) +
      "," +
      DateFormat('dd-MM-yyyy').format(record.createdTime!));

  // Example of date formating thanks to Edmund Ong
  // DateFormat('dd-MM-yyyy').format(record.attendanceDate!) +
  //     "," +
  //     DateFormat('HH:mm').format(record.timeIn!) +
  //     "," +

  final fileName = "FF_" + "meusanuncios_" + DateTime.now().toString() + ".csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
