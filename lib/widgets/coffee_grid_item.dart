import 'package:flutter/material.dart';

import '../utilities/constants.dart';

Widget coffeeGridItem({
  required double rating,
  required String imgUrl,
  required String name,
  required int price,
}) {
  return Container(
    width: 135,
    height: 235,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: kCardColor,
    ),
    child: Column(
      children: [
        Container(
          width: 111,
          height: 111,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
            image:
                DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: kCoffeeOrderRating.withOpacity(0.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: kCoffeeRatingStarOrder,
                    ),
                    const SizedBox(
                      width: 4.5,
                    ),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 35,
          child: Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 13),
        Container(
          height: 39,
          width: 111,
          decoration: BoxDecoration(
            color: kCoffeeGrid,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 0),
              Text(
                "\$$price",
                style: const TextStyle(fontSize: 16),
              ),
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
