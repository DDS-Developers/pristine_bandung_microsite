// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationBloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationEvent.dart';
import 'package:pristine_bandung_microsite/Features/QuizPage/Widgets/QuizCard.dart';
import 'package:pristine_bandung_microsite/Features/ResultQuizPage/ResultQuizPage.dart';
import 'package:pristine_bandung_microsite/Widgets/HeaderWidget.dart';

class QuizePageFourth extends StatefulWidget {
  @override
  State<QuizePageFourth> createState() => _QuizePageStateFourth();
}

class _QuizePageStateFourth extends State<QuizePageFourth> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= 425
        ? Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gedung_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: headerWidget(context)),
              body: ListView(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/CoverBanner.png"),
                          // scale: 0.1,
                          fit: BoxFit.fill),
                      // color: Color(0xFF08a396),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 30),
                        child: Text(
                          "Udah di kantor nih! Kebiasaan \n kamu di kantor ngapain aja sih ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(
                        context,
                      ).add(
                        NavigationPushed(
                            name: '/quizPageFifth', onCallback: () {}),
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 55, right: 55),
                      child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          // width: _width,
                          // height: _height,
                          curve: Curves.fastOutSlowIn,
                          child: Image.asset('assets/Q4A.png')
                          // child: quizCard(
                          //     context,
                          //     'A',
                          //     'Kerja efektif sesuai to-do-list, minum  air putih cukup, dan rutin stretching.',
                          //     'assets/place_holder_quiz.png'),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 25, bottom: 15),
                    child: Divider(
                      color: Color(0xFF08a396),
                      thickness: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(
                        context,
                      ).add(
                        NavigationPushed(
                            name: '/quizResultPage',
                            onCallback: () {},
                            arguments: ResultQuizArgs(
                                title: "WORKAHOLIC.",
                                value:
                                    "Duh euy, gawe wae atuh. Gawe boleh \n tapi kesehatanya dijaga dong. Biasain \n Pristime dengan rutin minum Pristine8.6+ \n yuk mulai sekarang biar pH tubuh \n kamu jadi seimbang")),
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 55, right: 55),
                        child: Image.asset('assets/Q4B.png')
                        // child: quizCard(
                        //     context,
                        //     'B',
                        //     'Kerja sampai lupa waktu, lupa makan, dan lupa minum.',
                        //     'assets/place_holder_quiz.png'),
                        ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gedung_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: headerWidget(context)),
              // appBar: PreferredSize(
              //     preferredSize: const Size.fromHeight(80),
              //     child: Image.asset(
              //       "HeaderWeb.png",
              //       fit: BoxFit.fitWidth,
              //       height: 80,
              //     )),
              body: ListView(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/CoverBanner.png"),
                          // scale: 0.1,
                          fit: BoxFit.fill),
                      // color: Color(0xFF08a396),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 40),
                        child: Text(
                          "Udah di kantor nih! Kebiasaan kamu di kantor ngapain aja sih ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(
                              context,
                            ).add(
                              NavigationPushed(
                                  name: '/quizPageFifth', onCallback: () {}),
                            );
                          },
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, right: 200),
                              child: Image.asset(
                                'assets/Q4A.png',
                                width: 500,
                              )),
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<NavigationBloc>(
                              context,
                            ).add(
                              NavigationPushed(
                                  name: '/quizResultPage',
                                  onCallback: () {},
                                  arguments: ResultQuizArgs(
                                      title: "WORKAHOLIC.",
                                      value:
                                          "Duh euy, gawe wae atuh. Gawe boleh \n tapi kesehatanya dijaga dong. Biasain \n Pristime dengan rutin minum Pristine8.6+ \n yuk mulai sekarang biar pH tubuh \n kamu jadi seimbang")),
                            );
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 50,
                              ),
                              child: Image.asset(
                                'assets/Q4B.png',
                                width: 500,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
