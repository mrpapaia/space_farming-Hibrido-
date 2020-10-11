import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  EditText({icon, hint, kbtype, isPasswd, onChange})
      : _icon = icon,
        _hint = hint,
        _kbType = kbtype,
        _isPasswd = isPasswd;
  Icon _icon;
  String _hint;
  TextInputType _kbType;
  bool _isPasswd;
  var error;
  var onChange;

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChange,
      obscureText: widget._isPasswd,
      keyboardType: widget._kbType,
      cursorColor: Colors.red,
      style: TextStyle(
        fontFamily: 'Robot',
        fontSize: 18,
        color: Color.fromRGBO(113, 111, 137, 1.0),
      ),
      decoration: InputDecoration(
        icon: widget._icon,
        hintStyle: TextStyle(
          fontFamily: 'Robot',
          fontSize: 18,
          color: Color.fromRGBO(113, 111, 137, 1.0),
        ),
        labelText: widget._hint,
        labelStyle: TextStyle(),
      ),
    );
  }
}
