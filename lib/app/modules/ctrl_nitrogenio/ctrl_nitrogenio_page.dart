import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
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

    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleOfScreen(
            title: "Nível Atual",
            font: "Revalia",
            fontSize: _width * 0.1,
          ),
          SizedBox(
            height: _height * 0.05,
          ),
          Center(
            child: Container(
              child: Center(
                child: Text(
                  "${widget.botijao.volAtual.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: _width * 0.3,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              width: _width - 30,
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
                height: _height * 0.05,
              ),
              ButtonCustom(
                text: "Medir Nivel",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/medirNivel',
                      arguments: [widget.botijao, widget.user]);
                },
                width: _width * 0.9,
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              ButtonCustom(
                text: "Abastecer",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/abastecer',
                      arguments: [widget.botijao, widget.user]);
                },
                width: _width * 0.9,
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              ButtonCustom(
                text: "Hístorico",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/historico',
                      arguments: [widget.botijao, null]);
                },
                width: _width * 0.9,
              ),
            ],
          )
        ],
      ),
    );
  }
}
