import 'package:flutter/material.dart';
import 'package:real_cafe/screens/nav_bar/home.dart';
import 'package:real_cafe/screens/nav_bar/likes.dart';
import 'package:real_cafe/screens/nav_bar/location.dart';
import 'package:real_cafe/screens/nav_bar/profile.dart';

import '../widgets/bottom_navigation_bar.dart';

class NavHome extends StatefulWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  int currentSelected = 0;

  final _pageController = PageController(
    initialPage: 0,
  );

  List<Widget> navbarPages = [
    const Home(),
    const Location(),
    const Likes(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    Navigator.of(context).popUntil((route) => route.isCurrent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: _pageController,
        children: navbarPages,
        onPageChanged: (int value) {
          setState(() {
            currentSelected = value;
          });
        },
      ),
      bottomNavigationBar: bottomNavBar(
        currentIndex: currentSelected,
        onTap: (int value) {
          setState(() {
            currentSelected = value;
          });
          _pageController.animateToPage(value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        },
        navigationItems: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 35,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
              size: 35,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              size: 35,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              size: 35,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
