import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../../constant.dart';

class NetworkUtility {
  static Future<String?> fetchUrl(
      String query, Map<String, String>? headers) async {
    try {
      Uri uri = Uri.https(
          "maps.googleapis.com",
          "maps/api/place/autocomplete/json", //unencodedPath
          {
            "input": query, // query parameter
            "key": googleApiKey, // apikey
          });
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
