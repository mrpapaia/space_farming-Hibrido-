import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'rack_info_controller.dart';

class RackInfoPage extends StatefulWidget {
  final String title;
  const RackInfoPage({Key key, this.title = "RackInfo"}) : super(key: key);

  @override
  _RackInfoPageState createState() => _RackInfoPageState();
}

class _RackInfoPageState
    extends ModularState<RackInfoPage, RackInfoController> {
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
        children: <Widget>[],
      ),
    );
  }
}
