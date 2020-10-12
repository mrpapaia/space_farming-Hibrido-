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
  User user;

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

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            100,
          ),
          child: SecAppBar()),
      drawer: NavigationDrawer(),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TitleOfScreen(
            title: "Nível Atual",
            font: "Revalia",
            fontSize: 32,
          ),
          Center(
            child: Container(
              child: Center(
                child: Observer(builder: (_) {
                  return Text(
                    "${widget.botijao.volAtual}",
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  );
                }),
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
              ButtonCustom(
                text: "Medir Nivel",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/medirNivel',
                      arguments: [widget.botijao, widget.user]);
                },
                width: 309.0,
              ),
              ButtonCustom(
                text: "Abastecer",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/abastecer',
                      arguments: [widget.botijao, widget.user]);
                },
                width: 309.0,
              ),
              ButtonCustom(
                text: "Hístorico do botijão",
                onclick: () {
                  Modular.to.pushNamed('/ctrl/historico',
                      arguments: [widget.botijao, null]);
                },
                width: 309.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
