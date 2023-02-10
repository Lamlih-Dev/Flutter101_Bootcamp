import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/auth/signin_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/onBoarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-COMMERCE APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Muli",
        primarySwatch: Colors.deepOrange,
      ),
      // home: const SigninScreen(),
      initialRoute: "/onboarding",
      routes: {
        "/onboarding": (context) => const OnboardingScreen(),
        "/signin": (context) => const SigninScreen(),
        "/signup": (context) => const SignupScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
