import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

class SecAppBar extends StatelessWidget implements PreferredSizeWidget {
  SecAppBar({Key key, this.preferredSize}) : super(key: key);
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    final double statusbarHeight = MediaQuery.of(context).padding.top;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return Container(
      height: preferredSize.height + statusbarHeight,
      color: Color.fromRGBO(229, 231, 236, 1.0),
      margin: EdgeInsets.only(top: statusbarHeight),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage('lib/app/shared/graphics/logo.png'),
                  width: sizeConfig.dynamicScaleSize(size: 70),
                  height: sizeConfig.dynamicScaleSize(size: 67),
                ),
                SizedBox(width: sizeConfig.dynamicScaleSize(size: 200)),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                    size: sizeConfig.dynamicScaleSize(size: 30),
                  ),
                  onPressed: () {
                    Modular.to.pop(context);
                  },
                ),
              ],
            ),
            Container(
              width: _width,
              height: sizeConfig.dynamicScaleSize(size: 3),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
