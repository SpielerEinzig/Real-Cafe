import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/coffee_order.dart';
import 'cart_item_card.dart';

class SlideAbleCartItem extends StatefulWidget {
  final int amount;
  final Function(BuildContext context) deleteButtonPressed;
  final VoidCallback plusButtonPressed;
  final VoidCallback minusButtonPressed;
  final CoffeeOrder coffeeOrder;

  const SlideAbleCartItem({
    Key? key,
    required this.deleteButtonPressed,
    required this.amount,
    required this.minusButtonPressed,
    required this.plusButtonPressed,
    required this.coffeeOrder,
  }) : super(key: key);

  @override
  State<SlideAbleCartItem> createState() => _SlideAbleCartItemState();
}

class _SlideAbleCartItemState extends State<SlideAbleCartItem> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: widget.deleteButtonPressed,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Remove',
            ),
          ],
        ),
        child: CartItemCard(
          amount: widget.amount,
          screenWidth: screenWidth,
          coffeeOrder: widget.coffeeOrder,
          plusButtonPressed: widget.plusButtonPressed,
          minusButtonPressed: widget.minusButtonPressed,
        ),
      ),
    );
  }
}
