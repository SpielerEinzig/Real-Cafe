import 'package:flutter/material.dart';

import '../models/coffee_order.dart';

List<CoffeeOrder> _favouritesList = [];

class FavouritesProvider with ChangeNotifier {
  List<CoffeeOrder> get favourites => _favouritesList;

  addItem({required CoffeeOrder item}) {
    _favouritesList.add(item);
    notifyListeners();
  }

  removeItem({required CoffeeOrder item}) {
    _favouritesList.remove(item);
    notifyListeners();
  }
}
