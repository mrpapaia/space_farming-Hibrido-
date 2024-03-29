import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

import 'ctrl_nitrogenio_controller.dart';

class CtrlNitrogenioPage extends StatefulWidget {
  final String title;
  Botijao botijao;
  UserP user;

  CtrlNitrogenioPage({Key key, this.title, this.botijao, this.user})
      : super(key: key);

  @override
  _CtrlNitrogenioPageState createState() => _CtrlNitrogenioPageState();
}

class _CtrlNitrogenioPageState
    extends ModularState<CtrlNitrogenioPage, CtrlNitrogenioController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(sizeConfig.dynamicScaleSize(
            size: 70,
            scaleFactorMini: 0.8,
            scaleFactorTablet: 0,
            scaleFactorNormal: 1)),
      ),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          TitleOfScreen(
            title: "Nível Atual",
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(
                size: 40,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 20,
                scaleFactorMini: 1,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          Center(
            child: Container(
              child: Center(
                child: Text(
                  "${widget.botijao.volAtual.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 100,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              width: sizeConfig.dynamicScaleSize(
                  size: _width,
                  scaleFactorMini: 1,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: Offset(5, 5),
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: sizeConfig.dynamicScaleSize(
                    size: 10,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
              ButtonCustom(
                text: "Medir Nível",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/medirNivel',
                      arguments: [widget.botijao, widget.user]);
                },
                width: sizeConfig.dynamicScaleSize(
                    size: _width - 30,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
              SizedBox(
                height: sizeConfig.dynamicScaleSize(
                    size: 10,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
              ButtonCustom(
                text: "Abastecer",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/abastecer',
                      arguments: [widget.botijao, widget.user]);
                },
                width: sizeConfig.dynamicScaleSize(
                    size: _width - 30,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
              SizedBox(
                height: sizeConfig.dynamicScaleSize(
                    size: 10,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
              ButtonCustom(
                text: "Histórico",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/historico',
                      arguments: [widget.botijao]);
                },
                width: sizeConfig.dynamicScaleSize(
                    size: _width - 30,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
              ButtonCustom(
                text: "Relatorio",
                onclick: () {
                  Modular.to
                      .pushNamed('/relatorio', arguments: [widget.botijao]);
                },
                width: sizeConfig.dynamicScaleSize(
                    size: _width - 30,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
            ],
          )
        ],
      ),
    );
  }
}
