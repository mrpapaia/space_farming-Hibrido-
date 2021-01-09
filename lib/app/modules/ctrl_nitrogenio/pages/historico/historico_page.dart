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
          preferredSize: Size.fromHeight(70.0),
        ),
        backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
        body: Column(
          children: [
            TitleOfScreen(
              title: "Histórico do Botijão",
              font: "Revalia",
              fontSize: 24,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: TabBarView(
                children: [
                  Observer(builder: (BuildContext context) {
                    if (controller.listHistNivel.data == null) {
                      return CircularProgressIndicator();
                    }
                    return HistoricoNivelComponent(
                      list: controller.listHistNivel.data,
                      botijao: controller.bot,
                    );
                  }),
                  Observer(builder: (BuildContext context) {
                    try {
                      if (controller.listHistAbastecimento.data != null) {
                        return HistoricoAbastecimentoComponent(
                          list: controller.listHistAbastecimento.data,
                          botijao: controller.bot,
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    } catch (NoSuchMethodError) {
                      return CircularProgressIndicator();
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
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Text(
                    "Nivel",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Abastecimento",
                    style: TextStyle(
                      fontSize: 20,
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
