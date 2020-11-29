import 'package:flutter/material.dart';

Widget slideLeftBackground() {
  return Container(
    color: Color.fromRGBO(229, 231, 236, 1.0),
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.red,
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
