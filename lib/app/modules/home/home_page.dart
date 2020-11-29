import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/home/components/HomeAppBar.dart';
import 'package:space_farming_modular/app/modules/home/components/gridViewList.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/caneca.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  DocumentReference doc;
  UserP userP;
  HomePage({Key key, this.title, this.doc, this.userP}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  List<Botijao> botijoes;

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (controller.listBot.data != null) {
            timer.cancel();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    startTimer();
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      resizeToAvoidBottomInset: false,
      drawer: NavigationDrawer(
        user: widget.userP,
      ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: HomeAppBar(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          TitleOfScreen(
            title: "Lista de Botijões",
            font: "Revalia",
            fontSize: _width * 0.07,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: _height * 0.79,
            child: Observer(
              builder: (BuildContext context) {
                try {
                  botijoes = controller.listBot.data;
                  return GridViewList(
                    listBotijao: botijoes,
                    user: widget.userP,
                  );
                  //Botijão 1- Boa nova
                } catch (NoSuchMethodError) {
                  return Column(
                    children: [
                      Center(
                        child: Text("Aguerde..."),
                      ),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
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
