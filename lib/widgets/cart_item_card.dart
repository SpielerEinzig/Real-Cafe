import 'package:flutter/material.dart';
import 'package:real_cafe/models/coffee_order.dart';

import '../utilities/constants.dart';

class CartItemCard extends StatefulWidget {
  final CoffeeOrder coffeeOrder;
  final double screenWidth;
  final VoidCallback plusButtonPressed;
  final VoidCallback minusButtonPressed;
  final int amount;
  const CartItemCard({
    Key? key,
    required this.coffeeOrder,
    required this.amount,
    required this.screenWidth,
    required this.minusButtonPressed,
    required this.plusButtonPressed,
  }) : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(widget.coffeeOrder.imgUrl),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: widget.screenWidth * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.coffeeOrder.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.coffeeOrder.addition,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${widget.coffeeOrder.price}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                width: widget.screenWidth * 0.23,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: widget.minusButtonPressed,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.amount.toString(),
                      style: const TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: widget.plusButtonPressed,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
