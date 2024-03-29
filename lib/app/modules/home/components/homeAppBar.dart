import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/modules/home/components/search.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String farmName;

  HomeAppBar({Key key, this.preferredSize, this.farmName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return Container(
      color: Color.fromRGBO(229, 231, 236, 1.0),
      height: preferredSize.height + statusbarHeight,
      child: Container(
        color: Color.fromRGBO(229, 231, 236, 1.0),
        margin: EdgeInsets.only(top: statusbarHeight),
        child: Container(
          width: sizeConfig.dynamicScaleSize(
              size: 150,
              scaleFactorMini: 0.725,
              scaleFactorTablet: 0,
              scaleFactorNormal: 0.81),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0, 0, 5.0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.red,
                    size: sizeConfig.dynamicScaleSize(
                        size: 40,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.9),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              SizedBox(
                width: sizeConfig.dynamicScaleSize(
                    size: 50,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 0.81),
              ),
              Text(
                farmName,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: sizeConfig.dynamicScaleSize(
                      size: 18,
                      scaleFactorMini: 1.2,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1.5),
                ),
              ), /*
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0, 2.5, 5.0),
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.red,
                      size: _width * 0.1,
                    ),
                    onPressed: () {
                      showSearch(context: context, delegate: Search());
                    }),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
