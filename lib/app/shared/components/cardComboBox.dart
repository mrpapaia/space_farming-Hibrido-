import 'package:flutter/material.dart';

class CardComboBox extends StatefulWidget {
  CardComboBox({text, value, itens, width, marginTop})
      : _text = text,
        _value = value,
        _itens = itens,
        _width = width,
        _marginTop = marginTop;
  String _text;
  String _value;
  List<String> _itens;
  double _width;
  double _marginTop;

  @override
  _CardComboBoxState createState() => _CardComboBoxState();
}

class _CardComboBoxState extends State<CardComboBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget._marginTop),
      width: widget._width,
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
      child: Row(
        children: [
          Container(
            child: Text(
              widget._text,
              style: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: 18,
                  color: Color.fromRGBO(113, 111, 137, 1.0)),
            ),
            margin: EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
          ),
          DropdownButton<String>(
            value: widget._value,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              width: 10,
              color: Colors.red,
            ),
            onChanged: (String newValue) {
              setState(() {
                widget._value = newValue;
              });
            },
            items: widget._itens.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
