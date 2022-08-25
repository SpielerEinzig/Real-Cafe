import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_cafe/provider/cart_provider.dart';
import 'package:real_cafe/screens/nav_bar/coupon_page.dart';
import 'package:real_cafe/utilities/constants.dart';
import 'package:real_cafe/utilities/no_animated_page_transition.dart';
import 'package:real_cafe/widgets/custom_button.dart';

import '../../widgets/cart_charges_column.dart';
import '../../widgets/slideable_cart_item.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double tax = 0;
  int total = 99;
  double deliveryFee = 50;
  int grandTotal = 0;

  _getCartTotal() {
    total = context.read<CartItemProvider>().getCartItemsTotalPrice();
    tax = context.read<CartItemProvider>().getCartItemsTotalTax();

    grandTotal = (total + tax + deliveryFee).round();
  }

  @override
  void initState() {
    super.initState();
    _getCartTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 25, color: kPrimary),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: kPrimary,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  children: context
                      .read<CartItemProvider>()
                      .cartItemsList
                      .map((item) {
                return SlideAbleCartItem(
                  deleteButtonPressed: (context) {
                    setState(() {
                      context.read<CartItemProvider>().removeItemFromCart(
                          cartItems: item, context: context);
                    });
                  },
                  plusButtonPressed: () {
                    setState(() {
                      context.read<CartItemProvider>().increaseItemAmount(
                          cartItems: item, context: context);
                      _getCartTotal();
                    });
                  },
                  minusButtonPressed: () {
                    setState(() {
                      context
                          .read<CartItemProvider>()
                          .reduceItemAmount(cartItems: item, context: context);
                      _getCartTotal();
                    });
                  },
                  amount: item.amount,
                  coffeeOrder: item.order,
                );
              }).toList()),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    cartCharges(
                        applyCouponTapped: () {
                          noAnimatedTransition(
                            context: context,
                            destinationPage: const CouponPage(),
                          );
                        },
                        deliveryPrice: deliveryFee,
                        texesAmount: tax,
                        grandTotal: grandTotal),
                    const SizedBox(height: 30),
                    customButton(
                        screenWidth: double.infinity,
                        text: "Pay Now",
                        onTap: () {})
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
