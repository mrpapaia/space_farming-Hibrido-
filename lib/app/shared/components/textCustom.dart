import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  TextCustom({Key key, this.text, this.fontSize}) : super(key: key);
  String text;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Robot",
        fontSize: fontSize,
        fontWeight: fontSize == 18 ? FontWeight.bold : FontWeight.normal,
        color: fontSize == 18 ? Colors.red : Color.fromRGBO(111, 137, 113, 1.0),
      ),
    );
  }
}
