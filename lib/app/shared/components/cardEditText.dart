import 'package:flutter/material.dart';

import 'my_icons_icons.dart';

class CardEditText extends StatefulWidget {
  CardEditText({
    this.child,
    this.width,
  });

  double width;

  Widget child;

  @override
  _CardEditTextState createState() => _CardEditTextState();
}

class _CardEditTextState extends State<CardEditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: widget.child,
      ),
    );
  }
}
