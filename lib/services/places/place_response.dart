import 'dart:convert';
import '../../model/autocomplete_prediction.dart';

class PlaceAutoCompleteResponse {
  final String? status;
  final List<AutoCompletePrediction>? predictions;
  PlaceAutoCompleteResponse({this.predictions, this.status});

  factory PlaceAutoCompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteResponse(
      status: json["status"] as String,
      // ignore: prefer_null_aware_operators
      predictions: json["predictions"] != null
          ? json["predictions"]
              .map<AutoCompletePrediction>(
                  (json) => AutoCompletePrediction.fromJson(json))
              .toList()
          : null,
    );
  }

  static PlaceAutoCompleteResponse parseAutoCompleteResult(
      String responsebody) {
    final parsed = json.decode(responsebody).cast<String, dynamic>();

    return PlaceAutoCompleteResponse.fromJson(parsed);
  }
}
