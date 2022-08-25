import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_cafe/models/address_details.dart';
import 'package:real_cafe/models/cart_item.dart';
import 'package:real_cafe/models/coffee_order.dart';
import 'package:real_cafe/screens/nav_home.dart';
import 'package:real_cafe/utilities/no_animated_page_transition.dart';

import '../widgets/show_snack_bar.dart';

class DatabaseUserService {
  final _fireStore = FirebaseFirestore.instance;

  ///User Data
  createUserDoc({
    required String name,
    required String email,
    required String uid,
    required context,
  }) async {
    try {
      await _fireStore.collection("Users").doc(uid).set({
        "name": name,
        "userId": uid,
        "email": email,
      });

      noAnimatedPushReplacement(
          context: context, destinationPage: const NavHome());
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  editUserDoc({
    required String name,
    required String uid,
    required String email,
    required context,
  }) async {
    try {
      await _fireStore.collection("Users").doc(uid).update({
        "name": name,
        "userId": uid,
        "email": email,
      });

      showSnackBar(context: context, text: "Edited details successfully");
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  ///Likes data
  addItemToUserLikes({
    required context,
    required String userId,
    required CoffeeOrder coffeeOrder,
  }) async {
    try {
      final itemInLikes = await _fireStore
          .collection("Likes")
          .where("name", isEqualTo: coffeeOrder.name)
          .get();

      final items = itemInLikes.docs;

      if (items.isEmpty) {
        await _fireStore.collection("Likes").add({
          "userId": userId,
          "imageUrl": coffeeOrder.imgUrl,
          "name": coffeeOrder.name,
          "rating": coffeeOrder.rating,
          "addition": coffeeOrder.addition,
          "description": coffeeOrder.description,
          "price": coffeeOrder.price,
        });
      } else {
        showSnackBar(context: context, text: "Item already in likes");
      }
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  removeItemFromLikes(
      {required context, required CoffeeOrder coffeeOrder}) async {
    try {
      await _fireStore.collection("Likes").doc(coffeeOrder.id).delete();
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  ///Address data
  addAddress({
    required context,
    required AddressModel addressModel,
    required String userId,
  }) async {
    try {
      await _fireStore.collection("Addresses").add({
        "name": addressModel.name,
        "houseNumber": addressModel.houseNumber,
        "isHome": addressModel.isHome,
        "phoneNumber": addressModel.phoneNumber,
        "state": addressModel.state,
        "zipCode": addressModel.zipCode,
        "userId": userId,
      });

      showSnackBar(context: context, text: "Address added");
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  removeAddress({
    required context,
    required AddressModel addressModel,
  }) async {
    try {
      await _fireStore.collection("Addresses").doc(addressModel.id).delete();

      showSnackBar(context: context, text: "Address removed");
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  ///Cart data
  addItemToCart({
    required CartItems cartItems,
    required String userId,
    required context,
  }) async {
    try {
      await _fireStore.collection("CartItems").add({
        "amount": cartItems.amount,
        "userId": userId,
        "name": cartItems.order.name,
        "rating": cartItems.order.rating,
        "addition": cartItems.order.addition,
        "description": cartItems.order.description,
        "price": cartItems.order.price,
        "imageUrl": cartItems.order.imgUrl,
      });

      showSnackBar(context: context, text: "Item added to cart");
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  updateCartItemAmount({
    required context,
    required CartItems cartItems,
    required bool increment,
  }) async {
    try {
      await _fireStore.collection("CartItems").doc(cartItems.id).update({
        "amount":
            increment ? FieldValue.increment(1) : FieldValue.increment(-1),
      });
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  removeCartItem({
    required context,
    required CartItems cartItems,
  }) async {
    try {
      await _fireStore.collection("CartItems").doc(cartItems.id).delete();
      showSnackBar(context: context, text: "Item removed from cart");
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }
}
