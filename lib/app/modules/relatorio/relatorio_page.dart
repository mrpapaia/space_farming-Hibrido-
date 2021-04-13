import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/modules/relatorio/components/grafico.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
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
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(sizeConfig.dynamicScaleSize(
            size: 70,
            scaleFactorMini: 0.8,
            scaleFactorTablet: 0,
            scaleFactorNormal: 1)),
      ),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
              child: Column(
                children: [
                  CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.parse("0001-01-01").toUtc(),
                      lastDate: DateTime.parse("9999-12-31").toUtc(),
                      onDateChanged: (aa) async {},
                      initialCalendarMode: DatePickerMode.year),
                  Text("data"),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: controller.selectedRadio,
                          onChanged: (val) {
                            setState(() {
                              controller.selectedRadio = val;
                            });
                          }),
                      Text(
                        "Ultimos Dias",
                      ),
                      Radio(
                          value: 2,
                          groupValue: controller.selectedRadio,
                          onChanged: (val) {
                            setState(() {
                              controller.selectedRadio = val;
                            });
                          }),
                      Text("Mês"),
                      Radio(
                          value: 3,
                          groupValue: controller.selectedRadio,
                          onChanged: (val) {
                            setState(() {
                              controller.selectedRadio = val;
                            });
                          }),
                      Text("Ano"),
                    ],
                  )
                ],
              ),
            ),
            Observer(builder: (BuildContext context) {
              // try {

              if (controller.listHistNivel.data != null) {
                controller.getSpots(days: 15);
                return Column(
                  children: [
                    Observer(builder: (BuildContext context) {
                      return Grafico(
                        controller: controller,
                        titulo: "Ultimos dias",
                        listSpots: controller.x == 0
                            ? controller.listSpotsDays
                            : controller.x == 1
                                ? controller.listSpotsWeek
                                : controller.listSpotsMonth,
                        nomes: controller.x == 0
                            ? controller.nomesDays
                            : controller.x == 1
                                ? controller.nomesWeek
                                : controller.nomesMonth,
                        click: () {
                          controller.teste(1);
                        },
                      );
                    }),
                  ],
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
