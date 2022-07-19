import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_cafe/screens/home_page.dart';
import 'package:real_cafe/utilities/no_animated_page_transition.dart';

import '../widgets/show_snack_bar.dart';

class DatabaseUserService {
  final _fireStore = FirebaseFirestore.instance;

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
          context: context, destinationPage: const HomePage());
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }
}
