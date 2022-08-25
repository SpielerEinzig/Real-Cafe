import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_cafe/models/coffee_order.dart';

import '../models/cart_item.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final DatabaseUserService _databaseUserService = DatabaseUserService();
User? user = AuthService().getUserAuthCredential;

List<CartItems> _cartItemList = [];

class CartItemProvider with ChangeNotifier {
  List<CartItems> get cartItemsList => _cartItemList;

  getCartItemsTotalPrice() {
    int price = 0;
    for (var item in _cartItemList) {
      price += item.order.price * item.amount;
    }

    return price;
  }

  getCartItemsTotalTax() {
    double price = 0;
    for (var item in _cartItemList) {
      price += (item.order.price * 0.08) * item.amount;
    }

    return price;
  }

  addItemToCart({required CoffeeOrder item, required context}) async {
    CartItems cartItems = CartItems(amount: 1, order: item, id: "");
    //_cartItemList.add(cartItems);
    await _databaseUserService.addItemToCart(
        cartItems: cartItems, userId: user!.uid, context: context);
    notifyListeners();
  }

  increaseItemAmount({required CartItems cartItems, required context}) async {
    await _databaseUserService.updateCartItemAmount(
        context: context, cartItems: cartItems, increment: true);
    notifyListeners();
  }

  reduceItemAmount({required CartItems cartItems, required context}) async {
    if (cartItems.amount > 1) {
      await _databaseUserService.updateCartItemAmount(
          context: context, cartItems: cartItems, increment: false);
    }
    notifyListeners();
  }

  removeItemFromCart({required CartItems cartItems, required context}) async {
    await _databaseUserService.removeCartItem(
        context: context, cartItems: cartItems);
    notifyListeners();
  }

  fetchAllCartItems() async {
    if (user != null) {
      _firebaseFirestore
          .collection("CartItems")
          .where("userId", isEqualTo: user!.uid)
          .snapshots()
          .listen((snapshot) {
        final snapshotRef = snapshot.docs;
        _cartItemList = snapshotRef.map((item) {
          return CartItems(
            amount: item["amount"],
            id: item.id,
            order: CoffeeOrder(
              id: item.id,
              addition: item["addition"],
              rating: item["rating"],
              description: item["description"],
              imgUrl: item["imageUrl"],
              name: item["name"],
              price: item["price"],
            ),
          );
        }).toList();
      });
    }
  }
}
