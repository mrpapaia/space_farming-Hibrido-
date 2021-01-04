import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/modules/ctrl_racks/components/gridviewracks.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';

import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';

import 'ctrl_racks_controller.dart';

class CtrlRacksPage extends StatefulWidget {
  final String title;
  CtrlRacksPage({
    Key key,
    this.title = "CtrlRacks",
  }) : super(key: key);

  @override
  _CtrlRacksPageState createState() => _CtrlRacksPageState();
}

class _CtrlRacksPageState
    extends ModularState<CtrlRacksPage, CtrlRacksController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),

      body: Column(
        children: [
          TitleOfScreen(
            title: "Lista de Racks",
            font: "Revalia",
            fontSize: 24,
          ),
          Observer(builder: (BuildContext context) {
            try {
              if (controller.listRack.data != null) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: GridViewRacks(
                      listRack: controller.listRacks.data,
                      controller: controller,
                    ));
              } else {
                return Text("asd");
              }
            } catch (NoSuchMethodError) {
              return CircularProgressIndicator();
            }
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/rack/addRack',
              arguments: [Rack(volume: "0.25", tipo: 'Convencional')]);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
