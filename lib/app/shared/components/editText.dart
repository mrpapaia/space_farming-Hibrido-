import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  EditText(
      {this.icon,
      this.texto,
      this.kbType,
      this.isPasswd,
      this.function,
      this.width,
      this.height,
      this.fontSize});

  IconData icon;
  String texto;
  TextInputType kbType;
  bool isPasswd;
  Function function;
  double width;
  double height;
  double fontSize;

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
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
        child: TextField(
          onChanged: widget.function,
          obscureText: widget.isPasswd,
          keyboardType: widget.kbType,
          cursorColor: Colors.red,
          style: TextStyle(
            fontFamily: 'Robot',
            fontSize: widget.fontSize,
            color: Color.fromRGBO(113, 111, 137, 1.0),
          ),
          decoration: InputDecoration(
            // filled: true,
            contentPadding: EdgeInsets.all(16),
            // fillColor: Colors.red,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.solid,
              ),
            ),
            prefixIcon: Icon(
              widget.icon,
              color: Colors.red,
              size: 30,
            ),
            hintStyle: TextStyle(
              fontFamily: 'Robot',
              fontSize: widget.fontSize,
              color: Color.fromRGBO(113, 111, 137, 1.0),
            ),
            labelText: widget.texto,
            labelStyle: TextStyle(),
          ),
        ),
      ),
    );
  }
}
