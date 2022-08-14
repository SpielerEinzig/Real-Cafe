import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class AddAddressTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const AddAddressTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 11),
        width: double.infinity,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimary),
          color: kTextFieldColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: kHintTextColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
