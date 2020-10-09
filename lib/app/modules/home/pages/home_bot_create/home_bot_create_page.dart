import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/cardComboBox.dart';
import 'package:space_farming_modular/app/shared/components/cardEditText.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'home_bot_create_controller.dart';

class HomeBotCreatePage extends StatefulWidget {
  final String title;
  const HomeBotCreatePage({Key key, this.title = "HomeBotCreate"})
      : super(key: key);

  @override
  _HomeBotCreatePageState createState() => _HomeBotCreatePageState();
}

class _HomeBotCreatePageState
    extends ModularState<HomeBotCreatePage, HomeBotCreateController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;

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
            title: 'Cadastrar Botijão',
            font: "Revalia",
            fontSize: 24,
          ),
          CardEditText(
            icon: Icon(
              MyIcons.icon_botijao,
              color: Colors.red,
            ),
            hint: 'Identificação do Botijão',
            width: _width,
            marginTop: 14.0,
          ),
          CardEditText(
            icon: Icon(
              MyIcons.icon_cap,
              color: Colors.red,
            ),
            hint: "Capacidade de nitrogênio em litros",
            width: _width,
            marginTop: 10.0,
          ),
          CardComboBox(
            text: "Quantidade de canecas:",
            value: "1",
            itens: ["1", "2", "3", "4", "5", "6"],
            width: _width,
            marginTop: 10.0,
          ),
          CardComboBox(
            text: "Quantidade de racks por caneca:",
            value: "1",
            itens: ["1", "2", "3", "4", "5", "6"],
            width: _width,
            marginTop: 10.0,
          ),
          CardComboBox(
            text: "Quantidade de palhetas por rack:",
            value: "1",
            itens: ["1", "2", "3", "4", "5", "6"],
            width: _width,
            marginTop: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  text: "Confirmar",
                  onclick: () {
                    Navigator.pop(context);
                  },
                  width: 148.0,
                ),
                ButtonCustom(
                  text: "Cancelar",
                  onclick: () {
                    Navigator.pop(context);
                  },
                  width: 148.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
