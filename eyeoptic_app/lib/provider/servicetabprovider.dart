import 'package:flutter/material.dart';

class ServiceTabProvider extends ChangeNotifier {
  bool _showMainService = true;
  bool get showMainService => _showMainService;

  void toggleDisplay() {
    _showMainService = !_showMainService;
    notifyListeners();
  }
}
