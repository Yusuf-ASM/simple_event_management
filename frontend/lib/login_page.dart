import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/buttons.dart';
import '../components/text_fields.dart';
import 'backend/shared_variables.dart';
import 'pages_backend/login.dart';

class LoginPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double maxWidth = width * 0.9;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        "NU Quantum-AI Hackathon",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      )),
                  Column(
                    children: [
                      SignInTextField(
                        hintText: "Your Username ex: potato",
                        controller: username,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: () {},
                      ),
                      PasswordTextField(
                        hintText: "Your password",
                        controller: password,
                        onSubmitted: () => loginButton(
                          username: username.text,
                          password: password.text,
                          context: context,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8,
                          left: maxWidth * 0.2,
                          right: maxWidth * 0.2,
                        ),
                        child: CustomButton(
                          text: "Login",
                          color: const Color.fromARGB(255, 39, 178, 243),
                          pressFunction: () => loginButton(
                            username: username.text,
                            password: password.text,
                            context: context,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(Version),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
