import 'package:flutter/material.dart';

Widget lideRightBackground() {
  return Container(
    color: Color.fromRGBO(229, 231, 236, 1.0),
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.edit,
            color: Colors.green,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
