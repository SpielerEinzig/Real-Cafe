import 'package:flutter/material.dart';
import 'package:real_cafe/utilities/constants.dart';

Widget bottomNavBar({
  required List<BottomNavigationBarItem> navigationItems,
  required Function(int) onTap,
  required int currentIndex,
}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: currentIndex,
    onTap: onTap,
    backgroundColor: kBackgroundColor,
    selectedItemColor: kPrimary,
    items: navigationItems,
    unselectedItemColor: kUnselectedColor,
  );
}
