import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';

import 'package:space_farming_modular/app/shared/components/cardEditText.dart';

import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'home_bot_create_controller.dart';

class HomeBotCreatePage extends StatefulWidget {
  HomeBotCreatePage({Key key}) : super(key: key);
  String inicio = "1";
  String inicio2 = "1";
  @override
  _HomeBotCreatePageState createState() => _HomeBotCreatePageState();
}

class _HomeBotCreatePageState
    extends ModularState<HomeBotCreatePage, HomeBotCreateController> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;

    List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleOfScreen(
            title: controller.botijao.idBot != null
                ? "Editar Botijão"
                : 'Cadastrar Botijão',
            font: "Revalia",
            fontSize: _width * 0.09,
          ),
          SizedBox(
            height: _height * 0.04,
          ),
          CardEditText(
            child: TextField(
              controller: controller.ctrl1,
              onChanged: controller.getId,
              obscureText: false,
              keyboardType: TextInputType.text,
              cursorColor: Colors.red,
              style: TextStyle(
                fontFamily: 'Robot',
                fontSize: _width * 0.05,
                color: Color.fromRGBO(113, 111, 137, 1.0),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                prefixIcon: Icon(MyIcons.bottle,
                    color: Colors.red, size: _width * 0.125),
                hintStyle: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: _width * 0.05,
                  color: Color.fromRGBO(113, 111, 137, 1.0),
                ),
                labelText: "Identificação do botijão",
                labelStyle: TextStyle(),
              ),
            ),
            width: _width,
          ),
          SizedBox(
            height: _height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardEditText(
                child: TextField(
                  controller: controller.ctrl2,
                  onChanged: controller.getVolTotal,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: _width * 0.05,
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    prefixIcon: Icon(MyIcons.volume,
                        color: Colors.red, size: _width * 0.125),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: _width * 0.05,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Vol. Total",
                    labelStyle: TextStyle(),
                  ),
                ),
                width: _width * 0.50,
              ),
              SizedBox(
                width: _width * 0.01,
              ),
              CardEditText(
                child: TextField(
                  controller: controller.ctrl3,
                  onChanged: controller.getVolAtual,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: _width * 0.05,
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    prefixIcon: Icon(MyIcons.volume,
                        color: Colors.red, size: _width * 0.125),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: _width * 0.05,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Vol. Atual",
                    labelStyle: TextStyle(),
                  ),
                ),
                width: _width * 0.50,
              ),
            ],
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          Container(
            height: _height * 0.08,
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
                        fontSize: _width * 0.05,
                        color: Color.fromRGBO(113, 111, 137, 1.0)),
                  ),
                  margin:
                      EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
                ),
                SizedBox(
                  height: _height * 0.01,
                ),
                DropdownButton<String>(
                  value: controller.botijao.numcanecas.toString(),
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
                      controller.botijao.numcanecas = int.parse(newValue);
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          Container(
            height: _height * 0.08,
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
                  value: controller.botijao.qtdDose.toString(),
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
                      controller.botijao.qtdDose = int.parse(newValue);
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
                    if (controller.edit) {
                      controller.updateBot();
                      Navigator.pop(context);
                    } else {
                      controller.addBot();
                      Navigator.pop(context);
                    }
                  },
                  width: _width * 0.5,
                ),
                ButtonCustom(
                  text: "Cancelar",
                  onclick: () {
                    Navigator.pop(context);
                  },
                  width: _width * 0.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
