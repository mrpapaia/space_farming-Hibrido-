import 'package:flutter/material.dart';

class SizeConfig {
  final MediaQueryData mediaQueryData;

  SizeConfig({this.mediaQueryData});

  static SizeConfig of(BuildContext context) =>
      SizeConfig(mediaQueryData: MediaQuery.of(context));

  double dynamicScaleSize(
      {double size, double scaleFactorTablet, double scaleFactorMini}) {
    if (isTablet()) {
      final scaleFactor = scaleFactorTablet ?? 2;
      return size * scaleFactor;
    }

    if (isMini()) {
      final scaleFactor = scaleFactorMini ?? 0.8;
      return size * scaleFactor;
    }
    print(mediaQueryData.size.shortestSide);
    return size;
  }

  bool isTablet() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide > 600;
  }

  bool isMini() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide <= 320;
  }
}
