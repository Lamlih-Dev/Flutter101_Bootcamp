import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios_new_rounded),
                Text("Sign Up"),
              ],
            ),
            Text("Register Account"),
            Text("Complete your details or continue \nwith social media"),
            TextField(),
            TextField(),
            TextField(),
            TextButton(
              onPressed: () => {print("hello")},
              child: Text("Continue"),
            ),
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
            Text(
                "By continuing your confirm that you agree \nwith our Term and Condition"),
          ],
        ),
      ),
    );
  }
}
