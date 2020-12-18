import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/ctrl_racks/components/gridviewracks.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'ctrl_racks_controller.dart';

class CtrlRacksPage extends StatefulWidget {
  final String title;
  CtrlRacksPage({Key key, this.title = "CtrlRacks", this.listRacks, this.user})
      : super(key: key);
  List<Rack> listRacks;
  UserP user;

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
            height: MediaQuery.of(context).size.height * 0.7,
            child: GridViewRacks(listRack: widget.listRacks),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/rack/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
