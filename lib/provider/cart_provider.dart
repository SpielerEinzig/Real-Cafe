import 'package:flutter/material.dart';
import 'package:real_cafe/models/coffee_order.dart';

import '../models/cart_item.dart';

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

  addItemToCart({required CoffeeOrder item}) {
    CartItems cartItems = CartItems(amount: 1, order: item);
    _cartItemList.add(cartItems);
    notifyListeners();
  }

  increaseItemAmount({required CartItems cartItems}) {
    int itemIndex = _cartItemList.indexOf(cartItems);
    _cartItemList[itemIndex].amount++;
    notifyListeners();
  }

  reduceItemAmount({required CartItems cartItems}) {
    int itemIndex = _cartItemList.indexOf(cartItems);
    if (_cartItemList[itemIndex].amount > 1) {
      _cartItemList[itemIndex].amount--;
    }
    notifyListeners();
  }

  removeItemFromCart({required CartItems cartItems}) {
    _cartItemList.remove(cartItems);
    notifyListeners();
  }
}
