import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/home/components/homeAppBar.dart';
import 'package:space_farming_modular/app/modules/home/components/gridViewList.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';

import '../../shared/components/my_icons_icons.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  List<Botijao> botijoes = List();
  var flag = false;

  void startTimer() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    startTimer();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      drawer: NavigationDrawer(controller: controller),
      appBar: HomeAppBar(
        farmName: "Space Farming",
        preferredSize: Size.fromHeight(sizeConfig.dynamicScaleSize(
            size: 70,
            scaleFactorMini: 0.8,
            scaleFactorTablet: 0,
            scaleFactorNormal: 1)),
      ),
      body: Column(
        children: [
          TitleOfScreen(
            title: "Lista de Botijões",
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(
                size: 30,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 5,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          Container(
            height: sizeConfig.dynamicScaleSize(
                size: _height,
                scaleFactorMini: 0.78,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8125),
            child: Observer(
              builder: (BuildContext context) {
                try {
                  if (controller.listBot.data.length == 0) {
                    return Center(
                      child: Text("Vazio"),
                    );
                  } else if (controller.listBot.data[0] != null) {
                    botijoes = controller.listBot.data;
                    return GridViewList(
                      listBotijao: botijoes,
                      user: controller.user,
                      height: _height,
                      width: _width,
                      controller: controller,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                } catch (NoSuchMethodError) {
                  return Column(
                    children: [
                      Center(
                        child: Text("Aguarde..."),
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
          Modular.to.pushNamed('/home/add', arguments: [
            controller.path,
            Botijao(numcanecas: 2, qtdDose: 1),
            false
          ]);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
