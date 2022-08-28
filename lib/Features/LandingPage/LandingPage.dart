// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationBloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationEvent.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormBloc.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormEvent.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Repositories/FormRepository.dart';
import 'package:pristine_bandung_microsite/Widgets/HeaderWidget.dart';

// ignore: use_key_in_widget_constructors
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("INI WIDTH NYA ${MediaQuery.of(context).size.width}");

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
                  preferredSize: const Size.fromHeight(65),
                  child: headerWidget(context)),
              body: ListView(
                children: [
                  Container(
                    height: 170,
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
                            const EdgeInsets.only(left: 15, right: 15, top: 30),
                        child: Text(
                          "Mainkan quiz Pristime \n It's Pristine8.6+ Time \n versi kamu!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  Image.asset(
                    'assets/Pristime_logo.png',
                    height: 60,
                  ),
                  AspectRatio(
                      aspectRatio: 1.5,
                      child: Image.asset(
                        'assets/Cover.png',
                      )),
                  // Image.asset(
                  //   'assets/orang_landing.png',
                  //   height: 230,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    child: Text(
                      'Dapatkan Hadiah Menarik ke acara \n Pristime di Ciwalk Bandung',
                      style: TextStyle(
                          color: Color(0xFF08a396),
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<FormBloc>(
                        context,
                      ).add(GenerateAccessToken());

                      BlocProvider.of<NavigationBloc>(
                        context,
                      ).add(
                        NavigationPushed(name: '/quizPage', onCallback: () {}),
                      );
                    },
                    child: Image.asset(
                      'assets/Cover_CTA.png',
                      height: 45,
                    ),
                  ),
                  // FractionallySizedBox(
                  //   widthFactor: 0.45,
                  //   child: MaterialButton(
                  //     onPressed: () {
                  //       BlocProvider.of<NavigationBloc>(
                  //         context,
                  //       ).add(
                  //         NavigationPushed(name: '/quizPage', onCallback: () {}),
                  //       );
                  //     },
                  //     elevation: 10,
                  //     minWidth: 120,
                  //     height: 45,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30)),
                  //     color: Color(0xFF08a396),
                  //     child: Text(
                  //       'MAIN SEKARANG!',
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
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
                    height: 170,
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
                            const EdgeInsets.only(left: 15, right: 15, top: 40),
                        child: Text(
                          "Mainkan quiz Pristime It's Pristine8.6+ Time versi kamu!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Pristime_logo.png',
                    height: 80,
                  ),
                  AspectRatio(
                      aspectRatio: 4.5,
                      child: Image.asset(
                        'assets/Cover.png',
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    child: Text(
                      'Dapatkan Hadiah Menarik ke acara \n Pristime di Ciwalk Bandung',
                      style: TextStyle(
                          color: Color(0xFF08a396),
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<FormBloc>(
                        context,
                      ).add(GenerateAccessToken());

                      BlocProvider.of<NavigationBloc>(
                        context,
                      ).add(
                        NavigationPushed(name: '/quizPage', onCallback: () {}),
                      );
                    },
                    child: Image.asset(
                      'assets/Cover_CTA.png',
                      height: 45,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
