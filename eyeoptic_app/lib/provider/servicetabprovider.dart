import 'package:eyeoptic_app/screen/admin/tabs/service%20content/addservicetab.dart';
import 'package:eyeoptic_app/screen/admin/tabs/service%20content/editservicetab.dart';
import 'package:eyeoptic_app/screen/admin/tabs/service%20content/mainservicecontent.dart';
import 'package:flutter/material.dart';

enum ServiceSection { addservice, editservice, mainservice }

class ServiceTabProvider extends ChangeNotifier {
  ServiceSection _currentTab = ServiceSection.mainservice;
  ServiceSection get showMainService => _currentTab;
  String _serviceID = '';

  void setServiceID(String id) => _serviceID = id;
  void toggleDisplay(ServiceSection serviceSection) {
    switch (serviceSection) {
      case ServiceSection.addservice:
        _currentTab = ServiceSection.addservice;
        break;
      case ServiceSection.editservice:
        _currentTab = ServiceSection.editservice;
        break;
      default:
        _currentTab = ServiceSection.mainservice;
        break;
    }

    notifyListeners();
  }

  Widget serviceTab() {
    if (_currentTab == ServiceSection.addservice) {
      return const AddService();
    } else if (_currentTab == ServiceSection.editservice) {
      return EditServiceTab(serviceID: _serviceID);
    } else {
      return const MainService();
    }
  }
}
