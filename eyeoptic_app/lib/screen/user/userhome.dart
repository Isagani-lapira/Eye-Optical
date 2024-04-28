import 'package:eyeoptic_app/screen/user/tabs/hometab.dart';
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
    const Text('Book tab'),
    const Text('Profile tab'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Row(children: [
          const CircleAvatar(),
          const SizedBox(width: 8.0),
          Text('Hello, Juan!', style: Theme.of(context).textTheme.labelMedium),
        ]),
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
