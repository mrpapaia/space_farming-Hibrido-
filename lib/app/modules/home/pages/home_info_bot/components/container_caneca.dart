import 'package:flutter/material.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

class ContainerCaneca extends StatelessWidget {
  ContainerCaneca({id, color, h, w, this.flag})
      : id = id,
        color = color,
        h = h,
        w = w;
  double w;
  double h;
  bool flag;
  String id;
  Color color;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Container(
      width: flag
          ? sizeConfig.dynamicScaleSize(
              size: 25,
              scaleFactorMini: 0.8,
              scaleFactorTablet: 0,
              scaleFactorNormal: 1)
          : sizeConfig.dynamicScaleSize(
              size: 50,
              scaleFactorMini: 0.8,
              scaleFactorTablet: 0,
              scaleFactorNormal: 1),
      height: flag
          ? sizeConfig.dynamicScaleSize(
              size: 25,
              scaleFactorMini: 0.8,
              scaleFactorTablet: 0,
              scaleFactorNormal: 1)
          : sizeConfig.dynamicScaleSize(
              size: 50,
              scaleFactorMini: 0.8,
              scaleFactorTablet: 0,
              scaleFactorNormal: 1),
      child: Center(
        child: Text(
          id,
          style: TextStyle(
              fontFamily: 'Robot',
              fontSize: sizeConfig.dynamicScaleSize(
                  size: 18,
                  scaleFactorMini: 0.8,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
              color: Colors.white),
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
            offset: Offset(1.5, 1.5),
          )
        ],
      ),
    );
  }
}
