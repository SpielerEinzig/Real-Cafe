import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/address_details.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final DatabaseUserService _databaseUserService = DatabaseUserService();
User? user = AuthService().getUserAuthCredential;

List<AddressModel> _savedAddresses = [];

class AddressProvider with ChangeNotifier {
  List<AddressModel> get savedAddresses => _savedAddresses;

  addItem({required AddressModel item, required context}) async {
    //_savedAddresses.add(item);
    if (user != null) {
      await _databaseUserService.addAddress(
        context: context,
        addressModel: item,
        userId: user!.uid,
      );
      notifyListeners();
    }
  }

  removeItem({required AddressModel item, required context}) async {
    //_savedAddresses.remove(item);
    await _databaseUserService.removeAddress(
        context: context, addressModel: item);
    notifyListeners();
  }

  fetchAllAddresses() async {
    if (user != null) {
      _firebaseFirestore
          .collection("Addresses")
          .where("userId", isEqualTo: user!.uid)
          .snapshots()
          .listen((snapshot) {
        final snapshotRef = snapshot.docs;
        _savedAddresses = snapshotRef.map((item) {
          return AddressModel(
              name: item["name"],
              houseNumber: item["houseNumber"],
              isHome: item["isHome"],
              phoneNumber: item["phoneNumber"],
              state: item["state"],
              zipCode: item["zipCode"],
              userId: user!.uid,
              id: item.id);
        }).toList();
      });
    }
  }
}
