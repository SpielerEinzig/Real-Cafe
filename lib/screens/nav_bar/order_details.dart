import 'package:flutter/material.dart';
import 'package:real_cafe/models/coffee_order.dart';

import '../../utilities/constants.dart';

class OrderDetails extends StatefulWidget {
  final CoffeeOrder coffeeOrder;
  const OrderDetails({Key? key, required this.coffeeOrder}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool liked = false;
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(widget.coffeeOrder.imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom: 40,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.coffeeOrder.name,
                        style:
                            const TextStyle(fontSize: 30, letterSpacing: 1.5),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            liked = !liked;
                          });
                        },
                        icon: liked
                            ? const Icon(
                                Icons.favorite,
                                size: 37,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border_outlined,
                                size: 37,
                              ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 220,
                        child: Text(
                          widget.coffeeOrder.addition,
                          style: const TextStyle(fontSize: 19),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: kCoffeeRatingStarOrder,
                          ),
                          const SizedBox(width: 8),
                          Text(widget.coffeeOrder.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.coffeeOrder.description,
                    style: const TextStyle(fontSize: 17),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Choice of Milk",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: screenWidth * 0.91,
                        height: 45,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: choiceOfMilk.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentSelected = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    width: screenWidth * 0.26,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: index == currentSelected
                                          ? kPrimary
                                          : kBackgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: kPrimary, width: 1.5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        choiceOfMilk[index],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: index == currentSelected
                                                ? kBackgroundColor
                                                : kPrimary),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Price",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 9),
                          Text(
                            "\$${widget.coffeeOrder.price}",
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      Container(
                        width: screenWidth * 0.6,
                        height: 45,
                        decoration: BoxDecoration(
                          color: kPrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
