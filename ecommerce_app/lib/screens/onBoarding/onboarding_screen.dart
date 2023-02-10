import 'package:ecommerce_app/screens/onBoarding/onboarding_content.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

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
                SizedBox(
                  height: 470,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: contents.length,
                    itemBuilder: (_, i) {
                      return Column(
                        children: [
                          contents[i].title!,
                          SizedBox(
                            height: 60,
                          ),
                          Image.asset(
                            width: 320,
                            height: 320,
                            contents[i].image!,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDots(index),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () => {
                    if (currentIndex == contents.length - 1)
                      {
                        Navigator.pushNamed(context, "/signin"),
                      },
                    _controller!.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn)
                  },
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

  Container buildDots(int index) {
    return Container(
      height: 6,
      width: currentIndex == index ? 22 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Color(0xFFF77547) : Color(0xFFD3D3D3),
      ),
    );
  }
}
