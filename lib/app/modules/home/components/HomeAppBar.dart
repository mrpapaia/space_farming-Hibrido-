import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      color: Color.fromRGBO(229, 231, 236, 1.0),
      height: _height * 0.13,
      child: Container(
        color: Color.fromRGBO(229, 231, 236, 1.0),
        margin: EdgeInsets.only(top: _height * 0.045),
        child: Container(
          width: _width * 0.5,
          margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0, 0, 5.0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.red,
                    size: _width * 0.1,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              Text(
                "Space Farming",
                style: TextStyle(color: Colors.red, fontSize: _width * 0.07),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0, 2.5, 5.0),
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.red,
                      size: _width * 0.1,
                    ),
                    onPressed: null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
