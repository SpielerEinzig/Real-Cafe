import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_cafe/services/database_service.dart';

import '../screens/home_page.dart';
import '../utilities/no_animated_page_transition.dart';
import '../widgets/show_snack_bar.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final DatabaseUserService _databaseUserService = DatabaseUserService();
  // User? _loggedInUser;
  //
  // getCurrentUser() async {
  //   try {
  //     final user = _firebaseAuth.currentUser;
  //
  //     if (user != null) {
  //       _loggedInUser = user;
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (kDebugMode) {
  //       print(e.message);
  //     }
  //   }
  // }

  createUserWithEmailAndPassword({
    required String email,
    required String password,
    required context,
    required String name,
  }) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _databaseUserService.createUserDoc(
          name: name, email: email, uid: user.user!.uid, context: context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, text: e.message!);
    }
  }

  loginUserWithEmailAndPassword({
    required context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      noAnimatedPushReplacement(
          context: context, destinationPage: const HomePage());
    } on FirebaseException catch (e) {
      showSnackBar(text: e.message!, context: context);
    }
  }
}
