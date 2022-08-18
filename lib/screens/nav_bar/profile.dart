import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_cafe/utilities/constants.dart';
import 'package:real_cafe/widgets/custom_button.dart';
import 'package:real_cafe/widgets/custom_text_field.dart';

import '../../provider/user_provider.dart';
import '../../services/auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _fireStore = FirebaseFirestore.instance;
  Map<String, dynamic>? userDetails;

  getUserDetails() async {
    User? user = AuthService().getUserAuthCredential;
    userDetails = context.read<UserDetailsProvider>().getFirestoreUserDetails;

    if (userDetails == null) {
      if (user != null) {
        final userRef =
            await _fireStore.collection("Users").doc(user.uid).get();
        final userData = userRef.data();
        userDetails = userData;
        context
            .read<UserDetailsProvider>()
            .setUserFirestoreDetails(userDetails: userData);
      }
    }

    await setNameTextFieldValue();

    await setEmailTextFieldValue();

    await Future.delayed(const Duration(milliseconds: 100));
  }

  setNameTextFieldValue() {
    _nameController.clear();
    String updatedText = _nameController.text + userDetails!["name"];

    _nameController.value = _nameController.value.copyWith(
      text: updatedText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: updatedText.length),
      ),
    );
  }

  setEmailTextFieldValue() {
    _emailController.clear();

    String updatedText = _emailController.text + userDetails!["email"];

    _emailController.value = _emailController.value.copyWith(
      text: updatedText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: updatedText.length),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: getUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kPrimary,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered: ${snapshot.error}"),
              );
            }

            return SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 31, vertical: 25),
                          height: size.height * 0.6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kCardColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * 0.07),
                                  customTextField(
                                      hintText: "Name",
                                      controller: _nameController,
                                      label: "Name",
                                      isPassword: false),
                                  SizedBox(height: size.height * 0.015),
                                  customTextField(
                                      hintText: "Email",
                                      controller: _emailController,
                                      label: "Email",
                                      isPassword: false),
                                ],
                              ),
                              customButton(
                                  screenWidth: size.width,
                                  text: "Save",
                                  onTap: () {}),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: const Alignment(0, -1),
                        child: Image.asset(
                          "assets/images/brand-logo.png",
                          width: 170,
                          height: 220,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
