import 'package:flutter/material.dart';

Map<String, dynamic>? _fireStoreUserDetails;

class UserDetailsProvider with ChangeNotifier {
  Map<String, dynamic>? get getFirestoreUserDetails => _fireStoreUserDetails;

  setUserFirestoreDetails({required Map<String, dynamic>? userDetails}) {
    _fireStoreUserDetails = userDetails;
    notifyListeners();
  }
}
