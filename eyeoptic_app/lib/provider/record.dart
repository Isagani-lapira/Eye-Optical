import 'package:flutter/material.dart';

enum MapData { profile, history, prelim, refraction, subjectiveRefract }

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
  final Map<String, String> _secondData = {
    'vao': '',
    'pIllness': '',
    'pastHistory': '',
    'ocular': '',
    'medical': '',
  };

  set mapData(Map<String, String> data) => _map.addAll(data);
  void addData(String key, String value, MapData mapData) {
    switch (mapData) {
      case MapData.profile:
        _firstSectionData[key] = value;
        break;
      case MapData.history:
        _secondData[key] = value;
        break;
      case MapData.prelim:
        print('prelim');
        break;
      case MapData.refraction:
        print('refraction');
        break;
      case MapData.subjectiveRefract:
        print('subjectiveRefract');
        break;
      default:
        throw Exception("Error: undefined scope");
    }
    notifyListeners();
  }

  Map<String, String> getData(MapData mapData) {
    switch (mapData) {
      case MapData.profile:
        return _firstSectionData;
      case MapData.history:
        return _secondData;
      default:
        throw Exception("Error: undefined scope");
    }
  }

  bool isSectionComplete(Map<String, String> data) {
    for (var value in data.values) {
      if (value.isEmpty) {
        return false;
      }
    }
    return true;
  }
}
