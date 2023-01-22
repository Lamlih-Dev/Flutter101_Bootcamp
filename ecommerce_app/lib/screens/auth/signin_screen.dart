import 'dart:async';

import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios_rounded),
              Text("Sign In"),
            ],
          ),
          Text("Welcome Back"),
          Text(
              "Sign in with your email and password \nor continue with social media"),
          TextField(),
          TextField(),
          Row(
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: onCheckBoxChangeState),
                  Text("Remember me"),
                ],
              ),
              Text("Forgot Password"),
            ],
          ),
          TextButton(onPressed: onTextButtonClick, child: Text("Continue")),
          Row(
            children: [
              Container(
                width: 14,
                height: 14,
                color: Colors.grey,
              ),
              Container(
                width: 14,
                height: 14,
                color: Colors.green,
              ),
              Container(
                width: 14,
                height: 14,
                color: Colors.red,
              ),
            ],
          ),
          Row(
            children: [
              Text("Don't have an account? "),
              Text("Sign Up"),
            ],
          )
        ],
      ),
    );
  }
}

void onCheckBoxChangeState(bool) {
  print("Checkbox state has been changed!");
}

void onTextButtonClick() {
  print("Button has been clicked!");
}
