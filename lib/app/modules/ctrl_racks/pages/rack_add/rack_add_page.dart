import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/cardEditText.dart';

import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'rack_add_controller.dart';

class RackAddPage extends StatefulWidget {
  final String title;
  Rack rack;
  RackAddPage({Key key, this.title = "RackAdd", this.rack}) : super(key: key);

  @override
  _RackAddPageState createState() => _RackAddPageState();
}

class _RackAddPageState extends ModularState<RackAddPage, RackAddController> {
  //use 'controller' variable to access controller
  String volumeInicio = "0.25";
  String tipoInicio = "Convencionado";
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    List<String> volume = ["0.25", "0.50"];
    List<String> tipo = ["Convencionado", "Sexado", "Embrião"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleOfScreen(
            title:
                widget.rack.idTouro != null ? "Editar Rack" : 'Adicionar Rack',
            font: "Revalia",
            fontSize: _width * 0.09,
          ),
          SizedBox(
            height: _height * 0.04,
          ),
          CardEditText(
            child: TextField(
              controller: null,
              onChanged: null,
              obscureText: false,
              keyboardType: TextInputType.text,
              cursorColor: Colors.red,
              style: TextStyle(
                fontFamily: 'Robot',
                fontSize: _width * 0.125,
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
                  fontSize: _width * 0.125,
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
                  controller: null,
                  onChanged: null,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: _width * 0.125,
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
                      fontSize: _width * 0.125,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Identificação do botijão",
                    labelStyle: TextStyle(),
                  ),
                ),
                width: _width,
              ),
              SizedBox(
                width: _width * 0.01,
              ),
              CardEditText(
                child: TextField(
                  controller: null,
                  onChanged: null,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: _width * 0.125,
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
                      fontSize: _width * 0.125,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Identificação do botijão",
                    labelStyle: TextStyle(),
                  ),
                ),
                width: _width,
              ),
            ],
          ),
          Container(
            height: _height * 0.08,
            margin: EdgeInsets.only(top: 10, right: _width * 0.25),
            width: _width * 0.75,
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
                        fontSize: 18,
                        color: Color.fromRGBO(113, 111, 137, 1.0)),
                  ),
                  margin:
                      EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
                ),
                DropdownButton<String>(
                  value: tipoInicio,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    width: 5,
                    color: Colors.red,
                  ),
                  onChanged: controller.volume,
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
            width: _width * 0.1,
          ),
          Container(
            height: _height * 0.08,
            margin: EdgeInsets.only(top: 10, right: _width * 0.60),
            width: _width * 0.40,
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
                        fontSize: _width * 0.05,
                        color: Color.fromRGBO(113, 111, 137, 1.0)),
                  ),
                  margin:
                      EdgeInsets.only(top: 0, left: 10, bottom: 0, right: 10),
                ),
                DropdownButton<String>(
                  value: volumeInicio,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    width: 5,
                    color: Colors.red,
                  ),
                  onChanged: controller.volume,
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
