import 'package:flutter/material.dart';

import '../utilities/constants.dart';

Widget logoShoppingCartRow({required Function() cartPressed}) {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 102,
          width: 131,
          decoration: const BoxDecoration(
            //color: Colors.red,
            image: DecorationImage(
                image: AssetImage("assets/images/brand-logo.png"),
                fit: BoxFit.cover),
          ),
        ),
        IconButton(
            onPressed: cartPressed,
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 35,
              color: kPrimary,
            )),
      ],
    ),
  );
}
