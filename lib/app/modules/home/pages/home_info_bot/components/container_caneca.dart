import 'package:flutter/material.dart';

class ContainerCaneca extends StatelessWidget {
  ContainerCaneca({id, color, h, w})
      : id = id,
        color = color,
        h = h,
        w = w;
  double w;
  double h;
  String id;
  Color color;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width * w,
      height: _height * h,
      child: Center(
        child: Text(
          id,
          style:
              TextStyle(fontFamily: 'Robot', fontSize: 18, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(126, 116, 116, 1.0), width: 2),
        borderRadius: BorderRadius.circular(200),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            offset: Offset(3, 3),
          )
        ],
      ),
    );
  }
}
