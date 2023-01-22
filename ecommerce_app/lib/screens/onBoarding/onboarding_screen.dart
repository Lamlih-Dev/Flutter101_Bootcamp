import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("TOKOTO"),
          Row(
            children: [
              Text("Welcome to "),
              Text("Tokoto, "),
              Text("Let's shop!"),
            ],
          ),
          /* REPRESENT THE ILLUSTRATION ON THE DESIGN */
          Container(
            width: 300,
            height: 300,
            color: Colors.orange,
          ),
          Row(
            children: [
              Container(
                width: 30,
                height: 10,
                color: Colors.orange,
              ),
              Container(
                width: 10,
                height: 10,
                color: Colors.grey,
                margin: EdgeInsets.all(7),
              ),
              Container(
                width: 10,
                height: 10,
                color: Colors.grey,
              ),
            ],
          ),
          TextButton(
            onPressed: () => {print("Button Clicked !")},
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }
}
