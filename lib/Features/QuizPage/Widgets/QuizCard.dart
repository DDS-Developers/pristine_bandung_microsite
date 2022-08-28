// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget quizCard(BuildContext context, String value, String title, String img) {
  double calHeightTitle = 0;
  double calHeightWhiteTitle = 0;
  title.contains("stretching")
      ? calHeightTitle = 300 * 1.03
      : calHeightTitle = 295;
  title.contains("stretching")
      ? calHeightWhiteTitle = 55 * 1.3
      : calHeightWhiteTitle = 55;
  return Container(
    alignment: Alignment.center,
    child: Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Color(0xFF08a396),
              borderRadius: BorderRadius.circular(25),
            ),
            height: calHeightTitle,
            width: 280,
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 23),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            height: 220,
            width: 274,
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 245),
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            height: calHeightWhiteTitle,
            width: 274,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF08a396),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Color(0xFF08a396), width: 2)),
            height: 40,
            width: 40,
            child: Center(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF08a396),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
