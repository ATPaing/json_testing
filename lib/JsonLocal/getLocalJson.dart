import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> readLocalJson(String jsonAsset) async {
  final String response = await rootBundle.loadString(jsonAsset);
  final Map<String, dynamic> data = json.decode(response);
  return data;
}

