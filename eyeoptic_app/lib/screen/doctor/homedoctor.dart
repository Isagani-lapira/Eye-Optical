import 'package:eyeoptic_app/provider/doctorappointmentprovider.dart';
import 'package:eyeoptic_app/screen/doctor/tabs/doctorhome.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:eyeoptic_app/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({super.key});

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  final List<Widget> _tabs = [
    ChangeNotifierProvider(
      create: (BuildContext context) => DoctorProvider(),
      child: const DoctorHomeTab(),
    ),
    const Text('Record'),
    const Text('Profile'),
  ];
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppString.appName,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontStyle: FontStyle.italic,
              color: AppColor.primaryColor,
            ),
      )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: _tabs[_currentTabIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'Record'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        selectedItemColor: AppColor.primaryColor,
      ),
    );
  }
}
