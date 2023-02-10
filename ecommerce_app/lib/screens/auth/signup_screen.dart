import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

var formKey = GlobalKey<FormState>();
String email = "", password = "", confirmPassword = "";
bool isVisible1 = false, isVisible2 = false;
TextEditingController _password = TextEditingController();
TextEditingController _confirmPassword = TextEditingController();

extension EmailValidation on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
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
                        "Sign Up",
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
                    "Register Account",
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
                    "Complete your details or continue \nwith social media",
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
                    controller: _password,
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isVisible1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      labelText: "Password",
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: (() {
                          isVisible1 = !isVisible1;
                          setState(() {});
                        }),
                        icon: Icon(
                          isVisible1 ? Icons.visibility_off : Icons.visibility,
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
                  TextFormField(
                    controller: _confirmPassword,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Field required";
                      } else {
                        if (_password.text != _confirmPassword.text) {
                          return "The password confirmation does not match";
                        } else {
                          return null;
                        }
                      }
                    },
                    onSaved: (String? value) {
                      confirmPassword = value!;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isVisible2,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      labelText: "Confirm Password",
                      hintText: "Re-enter your password",
                      suffixIcon: IconButton(
                        onPressed: (() {
                          isVisible2 = !isVisible2;
                          setState(() {});
                        }),
                        icon: Icon(
                          isVisible2 ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () => {signUp(context)},
                    child: Text("Continue"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xFFF77547),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
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
                          print("Google Sign Up Clicked !");
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
                          print("Facebook Sign Up Clicked !");
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
                          print("Twitter Sign Up Clicked !");
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
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
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

void signUp(context) {
  if (formKey.currentState!.validate()) {
    print(email);
    print(password);
    print(confirmPassword);
    formKey.currentState!.save();
    Navigator.pop(context);
  }
}
