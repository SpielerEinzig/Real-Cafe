import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_cafe/services/database_service.dart';
import 'package:real_cafe/widgets/show_snack_bar.dart';

import '../models/coffee_order.dart';
import '../services/auth_service.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final DatabaseUserService _databaseUserService = DatabaseUserService();
User? user = AuthService().getUserAuthCredential;

List<CoffeeOrder> _favouritesList = [];

class FavouritesProvider with ChangeNotifier {
  List<CoffeeOrder> get favourites => _favouritesList;

  addItem({required CoffeeOrder item, required context}) {
    //_favouritesList.add(item);
    _databaseUserService.addItemToUserLikes(
        context: context, userId: user!.uid, coffeeOrder: item);
    notifyListeners();
  }

  removeItem({required CoffeeOrder item, required context}) {
    CoffeeOrder? orderItem;
    for (var order in _favouritesList) {
      if (item.name == order.name) {
        orderItem = order;
      }
    }
    if (orderItem != null) {
      _databaseUserService.removeItemFromLikes(
          context: context, coffeeOrder: orderItem);
    } else {
      showSnackBar(text: "Error occurred", context: context);
    }
    notifyListeners();
  }

  fetchAllLikes() async {
    if (user != null) {
      _firebaseFirestore
          .collection("Likes")
          .where("userId", isEqualTo: user!.uid)
          .snapshots()
          .listen((snapshot) {
        final snapshotRef = snapshot.docs;
        _favouritesList = snapshotRef.map((item) {
          return CoffeeOrder(
            description: item["description"],
            name: item["name"],
            id: item.id,
            addition: item["addition"],
            imgUrl: item["imageUrl"],
            price: item["price"],
            rating: item["rating"],
          );
        }).toList();
      });
    }
  }
}
