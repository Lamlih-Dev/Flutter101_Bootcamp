import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(35),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "TOKOTO",
                  style: TextStyle(
                    color: Color(0xFFF77547),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Tokoto, ",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Let's shop!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                /* REPRESENT THE ILLUSTRATION ON THE DESIGN */
                Image.asset(
                  width: 320,
                  height: 320,
                  "assets/images/splash_1.png",
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 22,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFF77547),
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFD3D3D3),
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFD3D3D3),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () => {print("Button Clicked !")},
                  child: Text("Continue"),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFF77547),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 15,
                    ),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
