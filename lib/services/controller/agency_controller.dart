import 'package:flutter/material.dart';

class AgencyController extends ChangeNotifier {
  final List<String> _selectedAgency = <String>[];
  // getter to get the selected agency
  List<String> get getAgency => _selectedAgency;

  // Add agency to the list
  addAgencyTag(String agency) {
    _selectedAgency.add(agency);
    notifyListeners();
  }

// remove agency from the list
  removeAgencyTag(String agency) {
    _selectedAgency.remove(agency);
    notifyListeners();
  }
}
