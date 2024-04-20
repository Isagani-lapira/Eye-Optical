import 'package:eyeoptic_app/provider/doctortabprovider.dart';
import 'package:eyeoptic_app/provider/servicetabprovider.dart';
import 'package:eyeoptic_app/screen/admin/tabs/dashboardtab.dart';
import 'package:eyeoptic_app/screen/admin/tabs/doctor%20content/maindoctortab.dart';
import 'package:eyeoptic_app/screen/admin/tabs/servicetab.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _bottomNavList = [
    const DashBoardTab(),
    ChangeNotifierProvider(
        create: (BuildContext context) => ServiceTabProvider(),
        child: const ServiceTab()),
    ChangeNotifierProvider(
        create: (BuildContext context) => DoctorTabProvider(),
        child: const StreamDoctorTab()),
    const Text('Patient tab'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: _bottomNavList[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            label: 'Patients',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.textColor,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
