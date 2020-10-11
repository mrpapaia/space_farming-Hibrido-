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
        fontWeight: fontSize >= 16 ? FontWeight.bold : FontWeight.normal,
        color: fontSize >= 16 ? Colors.red : Color.fromRGBO(113, 111, 137, 1),
      ),
    );
  }
}
