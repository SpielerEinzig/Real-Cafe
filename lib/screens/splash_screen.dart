import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:real_cafe/screens/authentication_screens/log_in.dart';
import 'package:real_cafe/utilities/no_animated_page_transition.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = GetStorage();
  bool animate = false;

  animateLogo() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        animate = true;
      });
    });
  }

  navigate() {
    String? userId = storage.read('userId');

    Future.delayed(const Duration(seconds: 5), () {
      noAnimatedTransition(
        context: context,
        destinationPage: userId != null ? const HomePage() : const LogIn(),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    animateLogo();
  }

  @override
  Widget build(BuildContext context) {
    navigate();
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: animate
              ? Image.asset(
                  "assets/images/brand-logo.png",
                  width: 170,
                  height: 220,
                  fit: BoxFit.fitWidth,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
