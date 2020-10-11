import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/home/components/HomeAppBar.dart';
import 'package:space_farming_modular/app/modules/home/components/gridViewList.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  DocumentReference doc;
  HomePage({
    Key key,
    this.title,
    this.doc,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: HomeAppBar(),
      ),
      body: Column(
        children: [
          TitleOfScreen(
            title: "Lista de Botijões",
            font: "Revalia",
            fontSize: 24,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: Observer(
              builder: (BuildContext context) {
                try {
                  var length = controller.listBot.data.length;
                } catch (NoSuchMethodError) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<Botijao> botijoes = controller.listBot.data;
                return GridViewList(
                  listBotijao: botijoes,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/home/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
