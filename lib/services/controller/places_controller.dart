import 'package:flutter/material.dart';
import '../../model/autocomplete_prediction.dart';
import '../places/network_utility.dart';
import '../places/place_response.dart';

class PlacesController extends ChangeNotifier {
  List<AutoCompletePrediction> _placePrediction = <AutoCompletePrediction>[];
  List<AutoCompletePrediction> get placePrediction => _placePrediction;
  String _selectedLocation = '';
  // getter to get the selected location
  String get getLocation => _selectedLocation;

  // Creating the setter method
  setlocation(String location) {
    _selectedLocation = location;
    notifyListeners();
  }

  void placeAutoComplete(String query) async {
    // make Get request
    String? response = await NetworkUtility.fetchUrl(query, {});
    if (response != null) {
      PlaceAutoCompleteResponse result =
          PlaceAutoCompleteResponse.parseAutoCompleteResult(response);
      if (result.predictions != null) {
        _placePrediction = result.predictions!;
        notifyListeners();
      }
    }
  }
}
