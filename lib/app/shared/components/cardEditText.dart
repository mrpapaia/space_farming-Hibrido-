import 'package:flutter/material.dart';
import 'package:space_farming_modular/app/shared/components/editText.dart';

class CardEditText extends StatelessWidget {
  CardEditText({icon, hint, width, marginTop})
      : _icon = icon,
        _hint = hint,
        _width = width,
        _marginTop = marginTop;
  Icon _icon;
  String _hint;
  double _marginTop;
  double _width;
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
        child: EditText(
          hint: _hint,
          icon: _icon,
        ),
      ),
    );
  }
}
