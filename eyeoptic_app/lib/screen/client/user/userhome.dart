import 'package:eyeoptic_app/screen/client/user/tabs/appointmenttab.dart';
import 'package:eyeoptic_app/screen/client/user/tabs/hometab.dart';
import 'package:eyeoptic_app/widget/bottomnavbar/navbar.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabList = [
    const HomeTab(),
    const AppointmentTab(),
    const Text('Profile tab'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
          child: _tabList[_currentIndex],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
