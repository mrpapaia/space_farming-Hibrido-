import 'package:flutter/material.dart';

class ContainerBase extends StatelessWidget {
  ContainerBase({Key key, this.componets}) : super(key: key);
  List<Widget> componets;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: componets,
      ),
      width: _width - 30,
      padding: EdgeInsets.all(5.0),
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
    );
  }
}
