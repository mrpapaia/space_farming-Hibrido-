import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

class Grafico extends StatefulWidget {
  final List<FlSpot> listSpots;
  final List<dynamic> nomes;
  const Grafico({
    Key key,
    this.listSpots,
    this.nomes,
  }) : super(key: key);
  @override
  _GraficoState createState() => _GraficoState();
}

class _GraficoState extends State<Grafico> {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return Center(
      child: Container(
        margin: EdgeInsets.all(
          sizeConfig.dynamicScaleSize(
              size: 10,
              scaleFactorMini: 0.725,
              scaleFactorTablet: 0,
              scaleFactorNormal: 1),
        ),
        padding: EdgeInsets.all(sizeConfig.dynamicScaleSize(
            size: 20,
            scaleFactorMini: 0.725,
            scaleFactorTablet: 0,
            scaleFactorNormal: 1)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              offset: Offset(5, 5),
            )
          ],
        ),
        child: Center(
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: 51,
              lineBarsData: [
                LineChartBarData(
                  spots: widget.listSpots,
                ),
              ],
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: (value) {
                      return widget.nomes[value.toInt()];
                    }),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return '0';
                      case 5:
                        return '5';
                      case 10:
                        return '10';
                      case 15:
                        return '15';
                      case 20:
                        return '20';
                      case 25:
                        return '25';
                      case 30:
                        return '30';
                      case 35:
                        return '35';
                      case 40:
                        return '40';
                      case 45:
                        return '45';
                      case 50:
                        return '50';
                    }
                    return '';
                  },
                  margin: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
