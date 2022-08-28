// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationBloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationEvent.dart';
import 'package:pristine_bandung_microsite/Widgets/HeaderWidget.dart';
import 'package:share_plus/share_plus.dart';

class ResultQuizPage extends StatefulWidget {
  @override
  State<ResultQuizPage> createState() => _ResultQuizPageState();
}

class _ResultQuizPageState extends State<ResultQuizPage> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ResultQuizArgs;
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
                  // Text('INI NILAI A = ${args.a}   INI NILAI B = ${args.b}'),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Text(
                      "KAMU ADALAH",
                      style: TextStyle(
                          color: Color(0xFF08a396),
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 8, bottom: 20),
                    child: Text(
                      "SI ${args.title}",
                      style: TextStyle(
                          color: Color(0xFF08a396),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/place_holder_quiz.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      height: 285,
                      width: 274,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 25, top: 25),
                    child: Center(
                      child: Container(
                        // margin: EdgeInsets.only(top: 245),
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        // width: 274,
                        child: Text(
                          args.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF08a396),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: MaterialButton(
                      onPressed: () {
                        BlocProvider.of<NavigationBloc>(
                          context,
                        ).add(
                          NavigationPushed(
                              name: '/formPage', onCallback: () {}),
                        );
                      },
                      elevation: 10,
                      minWidth: 120,
                      height: 45,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color(0xFF08a396),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          'DAPATKAN EXCLUSIVE INVITATION DI SINI!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Text(
                      "Share to : ",
                      style: TextStyle(
                          color: Color(0xFF08a396),
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Color(0xFF08a396),
                              // size: 40,
                            ),
                            onPressed: () async {
                              print("Pressed");

                              fToast.showToast(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.greenAccent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.check),
                                      SizedBox(
                                        width: 12.0,
                                      ),
                                      Text(
                                          "Link Copied, Redirect to Instagram"),
                                    ],
                                  ),
                                ),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: Duration(seconds: 3),
                              );
                              ClipboardData data = ClipboardData(
                                  text:
                                      'https://bandung-staging.pristineofficial.com/#/');
                              await Clipboard.setData(data);

                              Timer(Duration(seconds: 3), () {
                                html.window.open(
                                    'https://www.instagram.com/', "_blank");
                              });

                              // Share.share(
                              //     "https://bandung-staging.pristineofficial.com/#/");
                            }),
                        IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(
                              FontAwesomeIcons.facebookSquare,
                              color: Color(0xFF08a396),
                              // size: 40,
                            ),
                            onPressed: () async {
                              fToast.showToast(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 12.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.greenAccent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.check),
                                      SizedBox(
                                        width: 12.0,
                                      ),
                                      Text("Link Copied, Redirect to Facebook"),
                                    ],
                                  ),
                                ),
                                gravity: ToastGravity.BOTTOM,
                                toastDuration: Duration(seconds: 3),
                              );
                              ClipboardData data = ClipboardData(
                                  text:
                                      'https://bandung-staging.pristineofficial.com/#/');
                              await Clipboard.setData(data);

                              Timer(Duration(seconds: 3), () {
                                html.window.open(
                                    'https://www.facebook.com/', "_blank");
                              });
                              print("Pressed");
                            }),
                      ],
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/place_holder_quiz.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          height: 330,
                          width: 330,
                        ),
                      ),
                      Flexible(
                          child: Column(children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 70),
                          child: Text(
                            "KAMU ADALAH",
                            style: TextStyle(
                                color: Color(0xFF08a396),
                                fontSize: 34,
                                fontWeight: FontWeight.w200),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 20),
                          child: Text(
                            "SI ${args.title}",
                            style: TextStyle(
                                color: Color(0xFF08a396),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, bottom: 25, top: 25),
                          child: Center(
                            child: Container(
                              // margin: EdgeInsets.only(top: 245),
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // width: 274,
                              child: Text(
                                args.value,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF08a396),
                                  fontSize: 33,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.6,
                          child: MaterialButton(
                            onPressed: () {
                              BlocProvider.of<NavigationBloc>(
                                context,
                              ).add(
                                NavigationPushed(
                                    name: '/formPage', onCallback: () {}),
                              );
                            },
                            elevation: 10,
                            minWidth: 120,
                            height: 55,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Color(0xFF08a396),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'DAPATKAN EXCLUSIVE INVITATION DI SINI!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Share to : ",
                                style: TextStyle(
                                    color: Color(0xFF08a396),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w200),
                                textAlign: TextAlign.center,
                              ),
                              IconButton(
                                  // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                  icon: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    color: Color(0xFF08a396),
                                    // size: 40,
                                  ),
                                  onPressed: () async {
                                    print("Pressed");

                                    fToast.showToast(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0, vertical: 12.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: Colors.greenAccent,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.check),
                                            SizedBox(
                                              width: 12.0,
                                            ),
                                            Text(
                                                "Link Copied, Redirect to Instagram"),
                                          ],
                                        ),
                                      ),
                                      gravity: ToastGravity.BOTTOM,
                                      toastDuration: Duration(seconds: 3),
                                    );
                                    ClipboardData data = ClipboardData(
                                        text:
                                            'https://bandung-staging.pristineofficial.com/#/');
                                    await Clipboard.setData(data);

                                    Timer(Duration(seconds: 3), () {
                                      html.window.open(
                                          'https://www.instagram.com/',
                                          "_blank");
                                    });

                                    // Share.share(
                                    //     "https://bandung-staging.pristineofficial.com/#/");
                                  }),
                              IconButton(
                                  // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                  icon: FaIcon(
                                    FontAwesomeIcons.facebookSquare,
                                    color: Color(0xFF08a396),
                                    // size: 40,
                                  ),
                                  onPressed: () async {
                                    fToast.showToast(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0, vertical: 12.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: Colors.greenAccent,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.check),
                                            SizedBox(
                                              width: 12.0,
                                            ),
                                            Text(
                                                "Link Copied, Redirect to Facebook"),
                                          ],
                                        ),
                                      ),
                                      gravity: ToastGravity.BOTTOM,
                                      toastDuration: Duration(seconds: 3),
                                    );
                                    ClipboardData data = ClipboardData(
                                        text:
                                            'https://bandung-staging.pristineofficial.com/#/');
                                    await Clipboard.setData(data);

                                    Timer(Duration(seconds: 3), () {
                                      html.window.open(
                                          'https://www.facebook.com/',
                                          "_blank");
                                    });
                                    print("Pressed");
                                  }),
                            ],
                          ),
                        ),
                      ])),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

class ResultQuizArgs {
  final String title;
  final String value;
  ResultQuizArgs({required this.title, required this.value});
}
