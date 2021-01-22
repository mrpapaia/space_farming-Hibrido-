import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/modules/ctrl_racks/components/gridviewracks.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

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
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),

      body: Column(
        children: [
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.81),
          ),
          TitleOfScreen(
            title: "Lista de Racks",
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(
                size: 35,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.81),
          ),
          Observer(builder: (BuildContext context) {
            try {
              if (controller.listRacks.data != null) {
                if (controller.listRacks.data.length == 0) {
                  return Center(child: Text("Vazio!"));
                } else {
                  return Container(
                    height: sizeConfig.dynamicScaleSize(
                        size: _height,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8),
                    child: GridViewRacks(
                      listRack: controller.listRacks.data,
                      controller: controller,
                    ),
                  );
                }
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                );
              }
            } catch (NoSuchMethodError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
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
