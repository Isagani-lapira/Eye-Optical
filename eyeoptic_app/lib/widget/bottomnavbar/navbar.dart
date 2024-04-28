import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Function(int index)? onChanged;
  const CustomBottomNavBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: AppColor.primaryColor,
      color: AppColor.primaryColor,
      items: [
        navBarItem(Icons.home, 'Home'),
        navBarItem(Icons.date_range, 'Book'),
        navBarItem(Icons.person, 'Profile'),
      ],
      onTap: (index) => onChanged!(index),
    );
  }
}

CurvedNavigationBarItem navBarItem(IconData iconData, String label) {
  return CurvedNavigationBarItem(
    child: Icon(
      iconData,
      color: Colors.white,
      size: 26,
    ),
    label: label,
    labelStyle: const TextStyle(color: Colors.white),
  );
}
