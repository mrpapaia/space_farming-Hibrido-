import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';

import 'package:space_farming_modular/app/shared/components/cardEditText.dart';

import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
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
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    List<String> items = ["2", "6", "8", "10"];

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
            title: controller.edit ? "Editar Botijão" : 'Cadastrar Botijão',
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(
                size: 30,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 30,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
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
                fontSize: sizeConfig.dynamicScaleSize(
                    size: 18,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
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
                  fontSize: sizeConfig.dynamicScaleSize(
                      size: 18,
                      scaleFactorMini: 0.725,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1),
                  color: Color.fromRGBO(113, 111, 137, 1.0),
                ),
                labelText: "Identificação do botijão",
                labelStyle: TextStyle(),
              ),
            ),
            width: sizeConfig.dynamicScaleSize(
                size: _width,
                scaleFactorMini: 1,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
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
                width: sizeConfig.dynamicScaleSize(
                    size: _width / 2,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
              SizedBox(
                width: sizeConfig.dynamicScaleSize(
                    size: 10,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
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
                width: sizeConfig.dynamicScaleSize(
                    size: _width / 2,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
              ),
            ],
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          Container(
            height: sizeConfig.dynamicScaleSize(
                size: 50,
                scaleFactorMini: 1,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
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
                  height: sizeConfig.dynamicScaleSize(
                      size: 10,
                      scaleFactorMini: 0.725,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1),
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
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          CardEditText(
            child: TextField(
              controller: controller.ctrl4,
              onChanged: controller.getDoses,
              obscureText: false,
              keyboardType: TextInputType.number,
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
                prefixIcon:
                    Icon(MyIcons.dose, color: Colors.red, size: _width * 0.125),
                hintStyle: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: _width * 0.05,
                  color: Color.fromRGBO(113, 111, 137, 1.0),
                ),
                labelText: "Quantidade de doses",
                labelStyle: TextStyle(),
              ),
            ),
            width: sizeConfig.dynamicScaleSize(
                size: _width,
                scaleFactorMini: 1,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
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
                    } else {
                      controller.addBot();
                    }
                    Navigator.pop(context);
                  },
                  width: sizeConfig.dynamicScaleSize(
                      size: _width / 2,
                      scaleFactorMini: 1,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1),
                ),
                ButtonCustom(
                  text: "Cancelar",
                  onclick: () {
                    Navigator.pop(context);
                  },
                  width: sizeConfig.dynamicScaleSize(
                      size: _width / 2,
                      scaleFactorMini: 1,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
