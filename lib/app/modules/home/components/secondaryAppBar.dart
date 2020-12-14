import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      height: _height * 0.171,
      color: Color.fromRGBO(229, 231, 236, 1.0),
      margin: EdgeInsets.only(top: _height * 0.041),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: _width * 0.03,
                ),
                Image(
                  image: AssetImage('lib/app/shared/graphics/logo.png'),
                  width: _width * 0.3,
                  height: _height * 0.09,
                ),
                SizedBox(width: _width * 0.5),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                    size: _width * 0.07,
                  ),
                  onPressed: () {
                    Modular.to.pop(context);
                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
