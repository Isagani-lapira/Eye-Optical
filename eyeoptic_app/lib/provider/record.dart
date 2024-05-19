import 'package:flutter/material.dart';

class RecordProvider extends ChangeNotifier {
  final Map<String, String> _map = {};
  final Map<String, String> _firstSectionData = {
    'fname': '',
    'lname': '',
    'age': '',
    'gender': '',
    'contact': '',
    'occupation': '',
    'street': '',
    'municipality': '',
    'sys': '',
    'dia': '',
    'rate': '',
    'pulse': '',
    'rightODSPH': '',
    'rightCYL': '',
    'rightAdd': '',
    'leftSPH': '',
    'leftCyl': '',
    'leftAdd': '',
    'rightOD': '',
    'leftOD': '',
  };

  set mapData(Map<String, String> data) => _map.addAll(data);
  void addFirstSecData(String key, String value) {
    _firstSectionData[key] = value;
    notifyListeners();
  }

  Map<String, String> get getFirstSecData => _firstSectionData;
  bool isSectionComplete(Map<String, String> data) {
    for (var value in data.values) {
      if (value.isEmpty) {
        return false;
      }
    }
    return true;
  }
}
