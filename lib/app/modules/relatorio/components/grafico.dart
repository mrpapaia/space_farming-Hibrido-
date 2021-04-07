import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:space_farming_modular/app/modules/relatorio/relatorio_controller.dart';

import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

class Grafico extends StatefulWidget {
  final List<FlSpot> listSpots;
  final List<dynamic> nomes;
  final String titulo;
  final Function click;
  final RelatorioController controller;

  const Grafico(
      {Key key,
      this.listSpots,
      this.nomes,
      this.click,
      this.titulo,
      this.controller})
      : super(key: key);

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.titulo,
                    style: TextStyle(
                        fontFamily: "Robot",
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 20,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        color: Colors.red),
                  ),
                  PopupMenuButton<int>(
                    icon: Icon(Icons.filter_list),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text("Dia"),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("Mês"),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text("Ano"),
                      ),
                    ],
                    onSelected: (value) {},
                  )
                ],
              ),
              ToggleButtons(
                  children: [Text("Dias"), Text("Semanas"), Text("Meses")],
                  isSelected: widget.controller.isSelected,
                  onPressed: (int index) {
                    setState(() {
                      widget.controller.setSelected(index);
                    });
                  }),
              Container(
                height: sizeConfig.dynamicScaleSize(
                    size: 300,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
                child: LineChart(
                  LineChartData(
                    minY: 0,
                    //maxY: 51,
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        if (value.toInt() % 5 == 0) {
                          return FlLine(
                            color: Colors.black,
                            strokeWidth: 1.5,
                          );
                        } else {
                          return FlLine(
                            color: Colors.red.withOpacity(0.9),
                            strokeWidth: 0,
                          );
                        }
                      },
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: widget.listSpots,
                        isCurved: true,
                        dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              if (widget.listSpots[index].y < 15) {
                                return FlDotCirclePainter(
                                  radius: 4,
                                  color: Colors.red,
                                  strokeWidth: 2,
                                  strokeColor: Colors.black,
                                );
                              } else if (widget.listSpots[index].y >= 15 &&
                                  widget.listSpots[index].y < 25) {
                                return FlDotCirclePainter(
                                  radius: 4,
                                  color: Colors.yellow,
                                  strokeWidth: 2,
                                  strokeColor: Colors.black,
                                );
                              } else {
                                return FlDotCirclePainter(
                                  radius: 4,
                                  color: Colors.green,
                                  strokeWidth: 2,
                                  strokeColor: Colors.black,
                                );
                              }
                            }),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: [
                            const Color(0xfff64f59).withOpacity(0.4),
                          ],
                        ),
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
                          if (value.toInt() % 5 == 0) {
                            return value.toInt().toString();
                          } else {
                            return "";
                          }
                        },
                        margin: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
