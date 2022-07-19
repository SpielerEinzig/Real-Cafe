import 'package:flutter/material.dart';
import 'package:real_cafe/screens/authentication_screens/log_in.dart';
import 'package:real_cafe/services/auth_service.dart';

import '../../utilities/constants.dart';
import '../../utilities/no_animated_page_transition.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _nameEdititngController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 102,
                    width: 131,
                    decoration: const BoxDecoration(
                      //color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("assets/images/brand-logo.png"),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  const SizedBox(height: 10),
                  customTextField(
                      isPassword: false,
                      hintText: "Enter your name",
                      controller: _nameEdititngController,
                      label: "Name"),
                  const SizedBox(height: 30),
                  customTextField(
                      isPassword: false,
                      hintText: "Enter your email",
                      controller: _emailEditingController,
                      label: "Email"),
                  const SizedBox(height: 30),
                  customTextField(
                      isPassword: true,
                      hintText: "Enter your password",
                      controller: _passwordController,
                      label: "Password"),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      noAnimatedPushReplacement(
                          context: context, destinationPage: const LogIn());
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        color: kPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              customButton(
                  screenWidth: size.width,
                  text: "Sign Up",
                  onTap: () async {
                    await _authService.createUserWithEmailAndPassword(
                        email: _emailEditingController.text,
                        password: _passwordController.text,
                        context: context,
                        name: _nameEdititngController.text);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
