import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/cardComboBox.dart';
import 'package:space_farming_modular/app/shared/components/cardEditText.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'home_bot_create_controller.dart';

class HomeBotCreatePage extends StatefulWidget {
  final String title;
  HomeBotCreatePage({Key key, this.title = "HomeBotCreate"}) : super(key: key);
  String inicio = "1";
  String inicio2 = "1";
  @override
  _HomeBotCreatePageState createState() => _HomeBotCreatePageState();
}

class _HomeBotCreatePageState
    extends ModularState<HomeBotCreatePage, HomeBotCreateController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    List<String> items = ["1", "2", "3", "4", "5", "6"];

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
          ContainerBase(
            componets: [
              Observer(builder: (_) {
                return TextField(
                  onChanged: controller.getId,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: 18,
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      MyIcons.icon_botijao,
                      color: Colors.red,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 18,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Identificação do Botijão",
                    labelStyle: TextStyle(),
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ContainerBase(
            componets: [
              Observer(builder: (_) {
                return TextField(
                  onChanged: controller.getVolTotal,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: 18,
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      MyIcons.icon_cap,
                      color: Colors.red,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 18,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Capacidade de nitrogênio em litros",
                    labelStyle: TextStyle(),
                  ),
                );
              }),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: _width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Quantidade de Canecas",
                    style: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: 18,
                        color: Color.fromRGBO(113, 111, 137, 1.0)),
                  ),
                  margin:
                      EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
                ),
                Observer(builder: (_) {
                  return DropdownButton<String>(
                    value: controller.numcanecas.toString(),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      width: 10,
                      color: Colors.red,
                    ),
                    onChanged: controller.getCanecas,
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                })
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: _width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Quantidade de Racks por Caneca",
                    style: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: 18,
                        color: Color.fromRGBO(113, 111, 137, 1.0)),
                  ),
                  margin:
                      EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
                ),
                DropdownButton<String>(
                  value: widget.inicio2,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    width: 10,
                    color: Colors.red,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      widget.inicio2 = newValue;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  text: "Confirmar",
                  onclick: () {
                    controller.remove("10");
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
