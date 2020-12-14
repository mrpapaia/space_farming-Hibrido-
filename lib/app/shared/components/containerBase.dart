import 'package:flutter/material.dart';

class ContainerBase extends StatelessWidget {
  ContainerBase({Key key, this.componets, this.height, this.width})
      : super(key: key);
  List<Widget> componets;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: componets,
      ),
      width: width,
      height: height,
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
