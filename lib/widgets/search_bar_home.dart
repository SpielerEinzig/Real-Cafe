import 'package:flutter/material.dart';

import '../utilities/constants.dart';

Widget searchBarHome({
  required double screenWidth,
  required Function(String) onChanged,
  required Function(String) onSubmitted,
}) {
  return Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: kCardColor,
    ),
    child: Row(
      children: [
        Icon(
          Icons.search,
          color: kPrimary.withOpacity(0.5),
          size: 30,
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: screenWidth * 0.65,
          height: 30,
          child: TextField(
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            style: const TextStyle(
              color: kPrimary,
              fontSize: 16,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Browse your favourite coffee...",
              hintStyle: TextStyle(
                color: kHintTextColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
