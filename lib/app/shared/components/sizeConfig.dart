import 'package:flutter/material.dart';

class SizeConfig {
  final MediaQueryData mediaQueryData;

  SizeConfig({this.mediaQueryData});

  static SizeConfig of(BuildContext context) =>
      SizeConfig(mediaQueryData: MediaQuery.of(context));

  double dynamicScaleSize(
      {double size,
      double scaleFactorTablet,
      double scaleFactorMini,
      double scaleFactorNormal}) {
    if (isMini()) {
      final scaleFactor = scaleFactorMini ?? 0.8;
      return size * scaleFactor;
    }

    if (isNormal()) {
      final scaleFactor = scaleFactorNormal ?? 0.8;
      return size * scaleFactor;
    }

    if (isNormal1()) {
      final scaleFactor = (scaleFactorNormal - 0.011) ?? 0.8;
      return size * scaleFactor;
    }
    if (isTablet()) {
      final scaleFactor = scaleFactorTablet ?? 2;
      return size * scaleFactor;
    }

    return size;
  }

  bool isTablet() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide > 600;
  }

  bool isNormal() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide <= 400;
  }

  bool isNormal1() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide > 410;
  }

  bool isMini() {
    final shortestSide = mediaQueryData.size.shortestSide;
    return shortestSide <= 320;
  }
}
