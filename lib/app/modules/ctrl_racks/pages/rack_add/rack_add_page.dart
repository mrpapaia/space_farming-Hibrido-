import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/editText.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'rack_add_controller.dart';

class RackAddPage extends StatefulWidget {
  final String title;
  const RackAddPage({Key key, this.title = "RackAdd"}) : super(key: key);

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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SecAppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleOfScreen(
            title: 'Adicionar Rack',
            font: "Revalia",
            fontSize: _width * 0.09,
          ),
          SizedBox(
            height: _height * 0.04,
          ),
          EditText(
            icon: Icons.ac_unit,
            function: controller.idToure,
            kbType: TextInputType.text,
            isPasswd: false,
            texto: "Id do Touro",
            width: _width,
            fontSize: _width * 0.05,
            height: _height * 0.09,
          ),
          SizedBox(
            height: _height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EditText(
                icon: Icons.arrow_upward,
                function: controller.idToure,
                kbType: TextInputType.number,
                isPasswd: false,
                texto: "Dose Up",
                width: _width * 0.50,
                fontSize: _width * 0.05,
                height: _height * 0.09,
              ),
              SizedBox(
                width: _width * 0.01,
              ),
              EditText(
                icon: Icons.arrow_downward,
                function: controller.idToure,
                kbType: TextInputType.number,
                isPasswd: false,
                texto: "Dose Down",
                width: _width * 0.50,
                fontSize: _width * 0.05,
                height: _height * 0.07,
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
