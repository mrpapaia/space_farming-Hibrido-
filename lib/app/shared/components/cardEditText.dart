import 'package:flutter/material.dart';
import 'package:space_farming_modular/app/shared/components/editText.dart';

class CardEditText extends StatelessWidget {
  CardEditText({icon, hint, width, marginTop, kbtype, isPasswd, onChange})
      : _icon = icon,
        _hint = hint,
        _width = width,
        _marginTop = marginTop,
        _kbType = kbtype,
        _isPasswd = isPasswd,
        _onChange = onChange;
  Icon _icon;
  String _hint;
  double _marginTop;
  double _width;
  TextInputType _kbType;
  bool _isPasswd;
  var _onChange;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _width,
        margin: EdgeInsets.only(top: _marginTop),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          // controller: widget.controller,
          onChanged: _onChange,
          obscureText: _isPasswd,
          keyboardType: _kbType,
          cursorColor: Colors.red,
          style: TextStyle(
            fontFamily: 'Robot',
            fontSize: 18,
            color: Color.fromRGBO(113, 111, 137, 1.0),
          ),
          decoration: InputDecoration(
            icon: _icon,
            hintStyle: TextStyle(
              fontFamily: 'Robot',
              fontSize: 18,
              color: Color.fromRGBO(113, 111, 137, 1.0),
            ),
            labelText: _hint,
            labelStyle: TextStyle(),
          ),
        ),
      ),
    );
  }
}
