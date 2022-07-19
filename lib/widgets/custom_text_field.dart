import 'package:flutter/material.dart';

import '../utilities/constants.dart';

Widget customTextField({
  required String hintText,
  required TextEditingController controller,
  required String label,
  required bool isPassword,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: kPrimary.withOpacity(0.8),
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: controller,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        obscureText: isPassword,
        style: TextStyle(color: kPrimary.withOpacity(0.8)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: kPrimary.withOpacity(0.7)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.2,
              color: kPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1.2,
              color: kPrimary,
            ),
          ),
        ),
      ),
    ],
  );
}
