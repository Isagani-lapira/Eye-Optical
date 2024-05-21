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
  final Map<String, String> _thirdData = {
    'dVARight': '',
    'dVALeft': '',
    'dVAOU': '',
    'nVARight': '',
    'nVALeft': '',
    'nVAOU': '',
    'pinholeRight': '',
    'pinholeLeft': '',
    'pinholeOU': '',
    'rxRightFar': '',
    'rxRightNear': '',
    'rxLeftFar': '',
    'rxLeftNear': '',
    'rxOUFar': '',
    'rxOUNear': '',
    'pupilRightShape': '',
    'pupilRightDia': '',
    'pupilLeftShape': '',
    'pupilLeftDia': '',
    'pd': '',
    'de': '',
    'pushUpAmp': '',
    'npc': '',
    'cornealRight': '',
    'cornealLeft': '',
    'scFar': '',
    'ccFar': '',
    'scNear': '',
    'ccNear': '',
    'smoothPursuit': '',
    'saccadic': '',
    'rxRightDlr': '',
    'rxRightIndirect': '',
    'rxRightAccom': '',
    'rxLeftDlr': '',
    'rxLeftIndirect': '',
    'rxLeftAccom': '',
    'rightODKeySwinging': '',
    'leftOSKeySwinging': '',
    'rightODKeyAmsler': '',
    'leftOSKeyAmsler': '',
    'rightODKeyProj': '',
    'leftOSKeyProj': '',
  };

  final Map<String, String> _fourthData = {
    'rightRetinoscopyFirst': '',
    'rightRetinoscopySecond': '',
    'leftRetinoscopyFirst': '',
    'leftRetinoscopySecond': '',
    'rightDynamicRetino': '',
    'leftDynamicRetino': '',
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
        _thirdData[key] = value;
        break;
      case MapData.refraction:
        _fourthData[key] = value;
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
      case MapData.prelim:
        return _thirdData;
      case MapData.refraction:
        return _fourthData;
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
