import 'package:flutter/material.dart';

Widget cartCharges({
  required double deliveryPrice,
  required VoidCallback applyCouponTapped,
  required double texesAmount,
  required int grandTotal,
}) {
  return Column(
    children: [
      Image.asset("assets/images/dashes.png"),
      const SizedBox(height: 20),
      GestureDetector(
        onTap: applyCouponTapped,
        child: Image.asset("assets/images/apply-coupon.png"),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Delivery Charges",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "\$ $deliveryPrice",
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Taxes",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "\$ ${num.parse(texesAmount.toStringAsFixed(2))}",
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Image.asset("assets/images/dashes.png"),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Grand Total",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "\$ ${grandTotal.toString()}",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    ],
  );
}
