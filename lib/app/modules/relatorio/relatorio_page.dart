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
        child: Observer(builder: (BuildContext context) {
          // try {
          if (controller.listHistNivel.data != null) {
            return Column(
              children: [
                CarouselSlider(
                  items: [
                    Grafico(
                      listSpots: controller.getSpotsPerMonth(3),
                      nomes: ["0", "1°", "2°", "3º", "4º", "5º"],
                    ),
                    Grafico(
                        listSpots: controller.getSpotsLastDays(),
                        nomes: controller.nomesLastDays),
                  ],
                  options: CarouselOptions(
                      height: sizeConfig.dynamicScaleSize(
                          size: 300,
                          scaleFactorMini: 0.725,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1)),
                ),
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
      ),
    );
  }
}
