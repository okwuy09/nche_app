import 'package:flutter/material.dart';

class AppStateController extends ChangeNotifier {
  final List<String> _casualandHostage = <String>[];
  // getter to get the selected CasualandHostage
  List<String> get getCasualandHostage => _casualandHostage;

  // Add CasualandHostage to the list
  addCasualandHostageTag(String agency) {
    _casualandHostage.add(agency);
    notifyListeners();
  }

  /// Type of incident session
  String _selectedIncident = '';
  // getter to get the selected location
  String get getIncident => _selectedIncident;

// List of incidents
  final List<String> incidentList = <String>[
    'Fire Hazard',
    'Theft / Armed Robbery',
    'Electrical Hazard',
    'Kidnap',
    'Chemical Hazard',
    'Water Hazard',
  ];

  // Creating incident setter method
  setIncident(String incident) {
    _selectedIncident = incident;
    notifyListeners();
  }

  /// Date and Time Session
  String _dateTime = '';
  // getter to get the selected location
  String get getDateTime => _dateTime;

  // Creating dateTime setter method
  setDateTime(String dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }
}
