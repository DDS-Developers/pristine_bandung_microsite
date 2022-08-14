// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigationPopped extends NavigationEvent {
  final bool reset;

  NavigationPopped({this.reset = false});
}

class NavigationPushed extends NavigationEvent {
  final String name;
  final dynamic arguments;
  final VoidCallback onCallback;

  NavigationPushed({
    required this.name,
    this.arguments,
    required this.onCallback,
  });
}
