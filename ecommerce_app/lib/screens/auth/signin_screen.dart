import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/StateCheckBoxButton.dart';

var formKey = GlobalKey<FormState>();
String email = "", password = "";
bool isChecked = false, isVisible = false;

extension EmailValidation on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(35),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: (() => Navigator.pop(context)),
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16,
                            color: Colors.grey,
                          )),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Sign in with your email and password \nor continue with social media",
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      // if (value!.length < 5) {
                      //   return "The length is < 5";
                      // } else if (!value.contains("@")) {
                      //   return "Email must contains @";
                      // } else if (!value.contains(".")) {
                      //   return "Email must contains .";
                      // } else {
                      //   return null;
                      // }

                      if (!value!.isValidEmail()) {
                        return "Email not valid";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String? value) {
                      email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      labelText: "Email",
                      hintText: "Enter your email",
                      suffixIcon: Icon(
                        Icons.email_outlined,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value!.length < 8) {
                        return "The length is < 8";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (String? value) {
                      password = value!;
                    },
                    obscureText: !isVisible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      labelText: "Password",
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: (() {
                          isVisible = !isVisible;
                          setState(() {});
                        }),
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          StateCheckBoxButton(),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () => {signIn(context)},
                    child: Text("Continue"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xFFF77547),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          print("Google Sign In Clicked !");
                        }),
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: SvgPicture.asset("assets/icons/google.svg"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (() {
                          print("Facebook Sign In Clicked !");
                        }),
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: SvgPicture.asset("assets/icons/facebook.svg"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (() {
                          print("Twitter Sign In Clicked !");
                        }),
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: SvgPicture.asset("assets/icons/twitter.svg"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFF77547),
                          ),
                          textAlign: TextAlign.center,
                        ),
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

  void signIn(context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print(email);
      print(password);
      Navigator.pushNamed(context, "/home");
    }
  }

  void onTextButtonClick() {
    print("Button has been clicked!");
  }
}
