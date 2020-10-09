import 'package:flutter/material.dart';

class TitleOfScreen extends StatefulWidget {
  TitleOfScreen({Key key, this.title, this.font, this.fontSize})
      : super(key: key);
  final String title;
  String font;
  double fontSize;

  @override
  _TitleOfScreenState createState() => _TitleOfScreenState();
}

class _TitleOfScreenState extends State<TitleOfScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.font,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5
                ..color = Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(5, 5),
                  blurRadius: 1.0,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontFamily: widget.font,
              fontWeight: widget.font == "Revalia"
                  ? FontWeight.normal
                  : FontWeight.bold,
              color: Colors.red,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(3, 3),
                  blurRadius: 1.0,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
