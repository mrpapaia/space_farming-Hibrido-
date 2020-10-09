import 'package:flutter/material.dart';

class SecAppBar extends StatelessWidget {
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage('lib/app/shared/graphics/logo.png'),
                    width: 100,
                    height: 50,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.white,
                margin: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
