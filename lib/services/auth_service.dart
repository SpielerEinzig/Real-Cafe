import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //final _usersRef = FirebaseFirestore.instance.collection("users");
  final _firebaseAuth = FirebaseAuth.instance;

  // Future<Map<String, dynamic>?> getUser({required String? uid}) async {
  //   if (uid != null) {
  //     final snap = await _usersRef.doc(uid).get();
  //     return snap.data();
  //   } else {
  //     return null;
  //   }
  // }

  signUpUserWithEmailAndPassword() async {
    try {} on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
