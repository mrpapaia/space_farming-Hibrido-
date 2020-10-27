import 'package:flutter/material.dart';

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
