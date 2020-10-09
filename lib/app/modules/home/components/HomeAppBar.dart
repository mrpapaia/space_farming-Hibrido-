import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(244, 67, 54, 1.0),
      height: 100,
      child: Container(
        color: Color.fromRGBO(229, 231, 236, 1.0),
        height: 10,
        margin: EdgeInsets.only(top: 24),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          margin: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Text(
                "Space Farming",
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.red,
                    size: 30,
                  ),
                  onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
