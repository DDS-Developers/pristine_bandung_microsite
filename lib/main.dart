import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationBloc.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormBloc.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormEvent.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/FormPage.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Repositories/FormRepository.dart';
import 'package:pristine_bandung_microsite/Features/LandingPage/LandingPage.dart';
import 'package:pristine_bandung_microsite/Features/QuizPage/QuizPage.dart';
import 'package:pristine_bandung_microsite/Features/QuizPage/QuizPageFifth.dart';
import 'package:pristine_bandung_microsite/Features/QuizPage/QuizPageFourth.dart';
import 'package:pristine_bandung_microsite/Features/QuizPage/QuizPageSecond.dart';
import 'package:pristine_bandung_microsite/Features/QuizPage/QuizPageThird.dart';
import 'package:pristine_bandung_microsite/Features/ResultQuizPage/ResultQuizPage.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    '/quizPage': (context) => QuizePageFirst(),
    '/quizPageSecond': (context) => QuizePageSecond(),
    '/quizPageThird': (context) => QuizePageThird(),
    '/quizPageFourth': (context) => QuizePageFourth(),
    '/quizPageFifth': (context) => QuizePageFifth(),
    '/quizResultPage': (context) => ResultQuizPage(),
    '/formPage': (context) => FormPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FormRepository>(
            create: (context) => FormRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            create: (context) => NavigationBloc(navigatorKey: _navigatorKey),
          ),
          BlocProvider<FormBloc>(
            create: (context) => FormBloc(
              RepositoryProvider.of<FormRepository>(context),
            ),
          ),
        ],
        child: Center(
          child: SizedBox(
            // width: 425,
            // height: 800,
            child: MaterialApp(
              // builder: (context, child) => ResponsiveWrapper.builder(
              //   child,
              //   maxWidth: 400,
              //   minWidth: 370,
              //   defaultScale: false,
              //   breakpoints: [
              //     ResponsiveBreakpoint.resize(800, name: MOBILE),
              //     ResponsiveBreakpoint.autoScale(800, name: TABLET),
              //   ],
              //   background: Container(color: Color(0xFFF5F5F5)),
              // ),
              title: '',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: 'LexendDeca',
              ),
              routes: _routes,
              navigatorKey: _navigatorKey,
              home: LandingPage(),
            ),
          ),
        ),
      ),
    );
  }
}
