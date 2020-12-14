import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_add_farm_controller.dart';

class HomeAddFarmPage extends StatefulWidget {
  final String title;
  const HomeAddFarmPage({Key key, this.title = "HomeAddFarm"})
      : super(key: key);

  @override
  _HomeAddFarmPageState createState() => _HomeAddFarmPageState();
}

class _HomeAddFarmPageState
    extends ModularState<HomeAddFarmPage, HomeAddFarmController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
