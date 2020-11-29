import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  ButtonCustom({text, onclick, width})
      : _text = text,
        _onclick = onclick,
        _width = width;
  String _text;
  double _width;
  Function _onclick;

  @override
  _ButtonCustomState createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    return ButtonTheme(
      height: 44.0,
      minWidth: widget._width,
      child: RaisedButton(
        onPressed: widget._onclick,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          widget._text,
          style: TextStyle(
              fontFamily: "Robot",
              fontSize: _width * 0.07,
              color: Colors.white),
        ),
        color: Colors.red,
      ),
    );
  }
}
