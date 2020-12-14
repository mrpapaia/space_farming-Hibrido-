import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/home/components/homeAppBar.dart';
import 'package:space_farming_modular/app/modules/home/components/gridViewList.dart';

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

  String path;
  void startTimer() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    startTimer();
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Container(
            color: Color.fromRGBO(229, 231, 236, 1.0),
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(controller.user.nome),
                  accountEmail: Text(controller.user.email),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      controller.user.email[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: _width * 0.09,
                      ),
                    ),
                  ),
                ),
                ExpansionTile(
                  title: Text("Fazendas"),
                  leading: Icon(
                    Icons.terrain,
                    color: Colors.red,
                    size: _width * 0.1,
                  ),
                  children:
                      List.generate(controller.user.fazenda.length, (index) {
                    return ExpansionTile(
                      title: Text(controller.user.fazenda.keys.toList()[index]),
                      leading: Icon(
                        Icons.terrain,
                        color: Colors.red,
                        size: _width * 0.1,
                      ),
                      children: [
                        ListTile(
                          leading: Icon(
                            MyIcons.icon_botijao,
                            color: Colors.red,
                            size: _width * 0.05,
                          ),
                          title: Text("Botijões"),
                          onTap: () {
                            path =
                                controller.user.fazenda.values.toList()[index];
                            controller.getBot(
                                controller.user.fazenda.values.toList()[index]);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.history,
                            color: Colors.red,
                            size: _width * 0.05,
                          ),
                          title: Text("Hístorico"),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.red,
                            size: _width * 0.05,
                          ),
                          title: Text("Colaboradores"),
                          onTap: () {},
                        ),
                      ],
                    );
                  }),
                ),
                ListTile(
                  leading: Icon(
                    Icons.add_location,
                    color: Colors.red,
                    size: _width * 0.1,
                  ),
                  title: Text("Adicionar Fazenda"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                    size: _width * 0.1,
                  ),
                  title: Text("Sair"),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Modular.to.pushNamed('/');
                  },
                ),
              ],
            )),
      ),
      appBar: HomeAppBar(
        preferredSize: Size.fromHeight(70.0),
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
            height: _height * 0.8,
            child: Observer(
              builder: (BuildContext context) {
                try {
                  if (controller.listBot.data[0].canecas[0] != null) {
                    botijoes = controller.listBot.data;
                    return GridViewList(
                      listBotijao: botijoes,
                      user: controller.user,
                      height: _height,
                      width: _width,
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
                        child: Text("Aguerde1..."),
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
          Modular.to.pushNamed('/home/add', arguments: path);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
