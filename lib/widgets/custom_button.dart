import 'package:flutter/material.dart';

import '../utilities/constants.dart';

Widget customButton(
    {required double screenWidth,
    required String text,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: screenWidth,
      height: 45,
      decoration: BoxDecoration(
        color: kPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
