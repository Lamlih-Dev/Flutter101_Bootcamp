import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OnBordingContent {
  String? image;
  Widget? title;

  OnBordingContent({this.image, this.title});
}

List<OnBordingContent> contents = [
  OnBordingContent(
    title: Row(
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
    image: "assets/images/splash_1.png",
  ),
  OnBordingContent(
    title: Text(
      "We help people connect with store \naround United State of America",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    ),
    image: "assets/images/splash_2.png",
  ),
  OnBordingContent(
    title: Text(
      "We show the easy wat to shop.\nJust stay at home with us",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    ),
    image: "assets/images/splash_3.png",
  ),
];
