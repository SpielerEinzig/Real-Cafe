import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CouponTicketWidget extends StatelessWidget {
  final String name;
  final String expiryDate;
  const CouponTicketWidget({
    Key? key,
    required this.name,
    required this.expiryDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: size.height * 0.12,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: kPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Expires on: $expiryDate",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.5),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: kPrimary,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
