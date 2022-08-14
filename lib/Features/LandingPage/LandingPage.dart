// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pristine_bandung_microsite/Widgets/HeaderWidget.dart';

// ignore: use_key_in_widget_constructors
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/gedung_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: headerWidget(context)),
        body: ListView(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Color(0xFF08a396),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    'Mainkan Bandung Lebih Baik versi Kamu bersama Pristine8.6+!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Image.asset('assets/orang_landing.png'),
            Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
              child: Text(
                'Dapatkan Exclusive Invitation ke acara Bandung Lebih Baik dengan Pristine8.6+',
                style: TextStyle(
                    color: Color(0xFF08a396),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.33, // means 100%, you can change this to 0.8 (80%)
              child: MaterialButton(
                onPressed: () {},
                elevation: 10,
                minWidth: 135,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Color(0xFF08a396),
                child: Text(
                  'COBA DI SINI!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
