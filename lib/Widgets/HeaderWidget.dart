// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget headerWidget(BuildContext context) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset('assets/logo_pristine.jpg'),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                'assets/menu.png',
                height: 35,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
