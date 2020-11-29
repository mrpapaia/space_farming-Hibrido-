import 'package:flutter/material.dart';

class ContainerCaneca extends StatelessWidget {
  ContainerCaneca({icon, color, h, w})
      : icon = icon,
        color = color,
        h = h,
        w = w;
  double w;
  double h;
  IconData icon;
  Color color;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width * w,
      height: _height * h,
      child: Icon(
        icon,
        color: Color.fromRGBO(229, 231, 236, 1.0),
        size: 10,
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
