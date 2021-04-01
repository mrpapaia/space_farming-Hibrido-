import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'relatorio_controller.dart';

class RelatorioPage extends StatefulWidget {
  final String title;
  const RelatorioPage({Key key, this.title = "Relatorio"}) : super(key: key);

  @override
  _RelatorioPageState createState() => _RelatorioPageState();
}

class _RelatorioPageState
    extends ModularState<RelatorioPage, RelatorioController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 500,
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
            ),
            Observer(builder: (BuildContext context) {
              // try {
              if (controller.listHistNivel.data != null) {
                print(controller.getSpotsMonth(3));
                return Container(
                  height: 300,
                  width: 300,
                  child: Center(
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 51,
                        lineBarsData: [
                          /* LineChartBarData(
                            spots: controller.getAllSpots(),
                          ),*/
                          LineChartBarData(
                            spots: controller.getSpotsMonth(3),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
              /* } catch (NoSuchMethodError) {
              print("exeçãp");
              return CircularProgressIndicator();
            }*/
            }),
          ],
        ),
      ),
    );
  }
}
