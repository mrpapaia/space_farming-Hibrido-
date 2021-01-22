import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/cardEditText.dart';

import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'rack_add_controller.dart';

class RackAddPage extends StatefulWidget {
  final String title;

  RackAddPage({
    Key key,
    this.title = "RackAdd",
  }) : super(key: key);

  @override
  _RackAddPageState createState() => _RackAddPageState();
}

class _RackAddPageState extends ModularState<RackAddPage, RackAddController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    List<String> volume = ["0.25", "0.50"];
    List<String> tipo = ["Convencional", "Sexado", "Embrião"];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
          ),
          TitleOfScreen(
            title: controller.rack.idTouro != null
                ? "Editar Rack"
                : 'Adicionar Rack',
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(
                size: 30,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
          ),
          CardEditText(
            child: TextField(
              controller: controller.ctrl1,
              onChanged: controller.idToure,
              obscureText: false,
              keyboardType: TextInputType.text,
              cursorColor: Colors.red,
              style: TextStyle(
                fontFamily: 'Robot',
                fontSize: sizeConfig.dynamicScaleSize(
                    size: 18,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 0.8),
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
                prefixIcon: Icon(MyIcons.cow,
                    color: Colors.red,
                    size: sizeConfig.dynamicScaleSize(
                        size: 35,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8)),
                hintStyle: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: sizeConfig.dynamicScaleSize(
                      size: 18,
                      scaleFactorMini: 0.725,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 0.8),
                  color: Color.fromRGBO(113, 111, 137, 1.0),
                ),
                labelText: "Identificação do Touro",
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
                scaleFactorMini: 0725,
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
                  onChanged: controller.doseUp,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 18,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8),
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
                    prefixIcon: Icon(MyIcons.dose,
                        color: Colors.red,
                        size: sizeConfig.dynamicScaleSize(
                            size: 35,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 0.8)),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.725,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 0.8),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Cima",
                    labelStyle: TextStyle(),
                  ),
                ),
                width: sizeConfig.dynamicScaleSize(
                    size: 225,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 0.8),
              ),
              SizedBox(
                width: sizeConfig.dynamicScaleSize(
                    size: 10,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 0.8),
              ),
              CardEditText(
                child: TextField(
                  controller: controller.ctrl3,
                  onChanged: controller.doseDown,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 18,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8),
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
                    prefixIcon: Icon(MyIcons.dose,
                        color: Colors.red,
                        size: sizeConfig.dynamicScaleSize(
                            size: 35,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 0.8)),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.725,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 0.8),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Baixo",
                    labelStyle: TextStyle(),
                  ),
                ),
                width: sizeConfig.dynamicScaleSize(
                    size: 225,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 0.8),
              ),
            ],
          ),
          Container(
            height: sizeConfig.dynamicScaleSize(
                size: 60,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
            margin: EdgeInsets.only(
                top: 10,
                right: sizeConfig.dynamicScaleSize(
                    size: 150,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 0.8)),
            width: sizeConfig.dynamicScaleSize(
                size: 300,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
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
                    "Tipo do semên:",
                    style: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 0.8),
                        color: Color.fromRGBO(113, 111, 137, 1.0)),
                  ),
                  margin:
                      EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
                ),
                DropdownButton<String>(
                  value: controller.rack.tipo,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    width: 5,
                    color: Colors.red,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      controller.rack.tipo = newValue;
                    });
                  },
                  items: tipo.map<DropdownMenuItem<String>>((String value) {
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
            width: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
          ),
          Container(
            height: sizeConfig.dynamicScaleSize(
                size: 60,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
            margin: EdgeInsets.only(
                top: 10,
                right: sizeConfig.dynamicScaleSize(
                    size: 250,
                    scaleFactorMini: 0.725,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 0.8)),
            width: sizeConfig.dynamicScaleSize(
                size: 200,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 0.8),
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
                    "Volume:",
                    style: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 0.8),
                        color: Color.fromRGBO(113, 111, 137, 1.0)),
                  ),
                  margin:
                      EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
                ),
                DropdownButton<String>(
                  value: controller.rack.volume,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    width: 5,
                    color: Colors.red,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      controller.rack.volume = newValue;
                    });
                  },
                  items: volume.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
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
                    controller.addRack(controller.rack);
                    Navigator.pop(context);
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
