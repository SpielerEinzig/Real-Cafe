import 'package:flutter/material.dart';
import 'package:real_cafe/screens/authentication_screens/sign_up.dart';
import 'package:real_cafe/utilities/constants.dart';
import 'package:real_cafe/utilities/no_animated_page_transition.dart';
import 'package:real_cafe/widgets/custom_button.dart';
import 'package:real_cafe/widgets/custom_text_field.dart';

import '../../services/auth_service.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
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
                    const SizedBox(height: 40),
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
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        noAnimatedPushReplacement(
                            context: context, destinationPage: const SignUp());
                      },
                      child: const Text(
                        "Create Account",
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
                    text: "Log In",
                    onTap: () async {
                      await _authService.loginUserWithEmailAndPassword(
                          context: context,
                          email: _emailEditingController.text,
                          password: _passwordController.text);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
