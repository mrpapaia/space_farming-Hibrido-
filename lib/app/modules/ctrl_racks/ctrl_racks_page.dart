import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/ctrl_racks/components/gridviewracks.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'ctrl_racks_controller.dart';

class CtrlRacksPage extends StatefulWidget {
  final String title;
  CtrlRacksPage({Key key, this.title = "CtrlRacks", this.doc, this.user})
      : super(key: key);
  DocumentReference doc;
  UserP user;

  @override
  _CtrlRacksPageState createState() => _CtrlRacksPageState();
}

class _CtrlRacksPageState
    extends ModularState<CtrlRacksPage, CtrlRacksController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SecAppBar(),
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: [
          TitleOfScreen(
            title: "Lista de Racks",
            font: "Revalia",
            fontSize: 24,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: Observer(builder: (_) {
              try {
                if (controller.listRack.data != null) {
                  return GridViewRacks(listRack: controller.listRack.data);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              } catch (NoSuchMethodError) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
