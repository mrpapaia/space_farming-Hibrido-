import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  EditText({icon, hint})
      : _icon = icon,
        _hint = hint;
  Icon _icon;
  String _hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.red,
      style: TextStyle(
        fontFamily: 'Robot',
        fontSize: 18,
        color: Color.fromRGBO(113, 111, 137, 1.0),
      ),
      decoration: InputDecoration(
        hintText: _hint,
        icon: _icon,
        hintStyle: TextStyle(
          fontFamily: 'Robot',
          fontSize: 18,
          color: Color.fromRGBO(113, 111, 137, 1.0),
        ),
        labelStyle: TextStyle(),
      ),
    );
  }
}
