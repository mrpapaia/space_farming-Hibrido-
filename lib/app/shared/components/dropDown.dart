import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({Key key, this.value, this.itens}) : super(key: key);
  String value;
  List<String> itens;
  @override
  _DropDown createState() => _DropDown(value: value, itens: itens);
}

class _DropDown extends State<DropDown> {
  _DropDown({this.value, this.itens});
  String value;
  List<String> itens;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          value = newValue;
        });
      },
      items: itens.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
