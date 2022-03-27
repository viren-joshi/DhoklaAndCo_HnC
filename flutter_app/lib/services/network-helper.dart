import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const String domain = 'https://baa3-103-59-191-47.ngrok.io';

class NetworkHelper {
  static Future<Map> findPlantDisease(String imageUrl) async {
    var url = Uri.parse('$domain/checkDisease');
    var body = json.encode({'link': imageUrl});
    print(body);
    var response = await http.post(
      url,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      Map decoded = jsonDecode(response.body) as Map;
      return decoded;
    } else {
      return {'message': 'Error'};
    }
  }
}
