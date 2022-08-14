import 'package:flutter/material.dart';

import '../models/address_details.dart';

List<AddressModel> _savedAddresses = [
  AddressModel(
      name: "Ryan",
      houseNumber:
          "B-22/3, Samaya pur Badli Ind. area , New Delhi, Delhi 110042 ",
      isHome: true,
      phoneNumber: 09094836961,
      state: "Delta state",
      zipCode: 370142),
  AddressModel(
      name: "Them",
      houseNumber: "B-22/3, Samaya pur Badli Ind.",
      isHome: false,
      phoneNumber: 09094836961,
      state: "Delta state",
      zipCode: 370142),
];

class AddressProvider with ChangeNotifier {
  List<AddressModel> get savedAddresses => _savedAddresses;

  addItem({required AddressModel item}) {
    _savedAddresses.add(item);
    notifyListeners();
  }

  removeItem({required AddressModel item}) {
    _savedAddresses.remove(item);
    notifyListeners();
  }
}
