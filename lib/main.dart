import 'package:flutter/material.dart';
import 'package:pristine_bandung_microsite/Features/LandingPage/LandingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  final _routes = {
    '/landingPage': (context) => LandingPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _routes,
      navigatorKey: _navigatorKey,
      home: LandingPage(),
    );
  }
}
