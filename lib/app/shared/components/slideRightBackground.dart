import 'package:flutter/material.dart';

Widget lideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
