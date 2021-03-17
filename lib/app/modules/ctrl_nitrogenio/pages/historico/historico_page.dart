import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/historico/components/historicoAbastecimento.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/historico/components/historicoNivel.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'historico_controller.dart';

class HistoricoPage extends StatefulWidget {
  final String title;

  HistoricoPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState
    extends ModularState<HistoricoPage, HistoricoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: SecAppBar(
          preferredSize: Size.fromHeight(sizeConfig.dynamicScaleSize(
              size: 70,
              scaleFactorMini: 0.8,
              scaleFactorTablet: 0,
              scaleFactorNormal: 1)),
        ),
        backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
        body: Column(
          children: [
            TitleOfScreen(
              title: "Histórico do Botijão",
              font: "Revalia",
              fontSize: sizeConfig.dynamicScaleSize(
                  size: 30,
                  scaleFactorMini: 0.75,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            Container(
              height: sizeConfig.dynamicScaleSize(
                  size: 600,
                  scaleFactorMini: 0.7,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
              child: TabBarView(
                children: [
                  Observer(builder: (BuildContext context) {
                    if (controller.listHistNivel.data == null) {
                      return Center(child: CircularProgressIndicator());
                      ;
                    } else {
                      if (controller.listHistNivel.data.length == 0) {
                        return Center(child: Text("Vazio!"));
                      } else {
                        return HistoricoNivelComponent(
                          list: controller.listHistNivel.data,
                          botijao: controller.bot,
                        );
                      }
                    }
                  }),
                  Observer(builder: (BuildContext context) {
                    try {
                      if (controller.listHistAbastecimento.data != null) {
                        if (controller.listHistAbastecimento.data.length == 0) {
                          return Center(child: Text("Vazio!"));
                        } else {
                          return HistoricoAbastecimentoComponent(
                            list: controller.listHistAbastecimento.data,
                            botijao: controller.bot,
                          );
                        }
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    } catch (NoSuchMethodError) {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizeConfig.dynamicScaleSize(
                  size: 350,
                  scaleFactorMini: 0.75,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
              height: sizeConfig.dynamicScaleSize(
                  size: 50,
                  scaleFactorMini: 0.75,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Text(
                    "Nível",
                    style: TextStyle(
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 20,
                          scaleFactorMini: 0.72,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                    ),
                  ),
                  Text(
                    "Abastecimento",
                    style: TextStyle(
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 20,
                          scaleFactorMini: 0.72,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                    ),
                  ),
                ],
                indicatorColor: Colors.red,
                labelColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
