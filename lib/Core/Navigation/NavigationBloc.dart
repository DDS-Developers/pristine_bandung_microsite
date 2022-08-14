// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationEvent.dart';

class NavigationBloc extends Bloc<NavigationEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationBloc({required this.navigatorKey}) : super(0);
  @override
  Stream<dynamic> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationPopped) {
      if (event.reset == true) {
        navigatorKey.currentState!
            .popUntil((Route<dynamic> route) => route.isFirst);
      } else {
        navigatorKey.currentState!.pop();
      }
    } else if (event is NavigationPushed) {
      navigatorKey.currentState!.pushNamed(
        event.name,
        arguments: event.arguments,
      );
      yield "Updated";
    }
  }
}
