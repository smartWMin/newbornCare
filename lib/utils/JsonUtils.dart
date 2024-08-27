
import 'dart:convert';
import 'package:flutter/services.dart';

class JsonUtils {

  static Future<List<dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

}