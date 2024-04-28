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
    const Text('Home tab'),
    const Text('Book tab'),
    const Text('Profile tab'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CircleAvatar(),
        title: const Text('Hello, Juan!'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
        child: _tabList[_currentIndex],
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
