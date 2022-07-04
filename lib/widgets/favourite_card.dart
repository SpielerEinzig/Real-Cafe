import 'package:flutter/material.dart';

import '../utilities/constants.dart';

Widget favouriteCard({
  required double screenWidth,
  required String imageUrl,
  required String name,
  required String shortDescription,
  required int price,
  required Function() favouriteButtonPressed,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: kCardColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: screenWidth * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    shortDescription,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\$$price",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: favouriteButtonPressed,
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
        )
      ],
    ),
  );
}
