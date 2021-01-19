import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/cardEditText.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'abastecer_controller.dart';

class AbastecerPage extends StatefulWidget {
  final String title;
  AbastecerPage({
    Key key,
    this.title = "Abastecer",
  }) : super(key: key);

  @override
  _AbastecerPageState createState() => _AbastecerPageState();
}

class _AbastecerPageState
    extends ModularState<AbastecerPage, AbastecerController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: sizeConfig.dynamicScaleSize(size: 10),
            ),
            TitleOfScreen(
              title: "Abastecer",
              font: "Revalia",
              fontSize: sizeConfig.dynamicScaleSize(size: 30),
            ),
            SizedBox(
              height: sizeConfig.dynamicScaleSize(size: 20),
            ),
            ContainerBase(
              width: _width,
              componets: <Widget>[
                TextField(
                  onChanged: controller.getVol,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: sizeConfig.dynamicScaleSize(size: 18),
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(MyIcons.volume,
                        color: Colors.red, size: _width * 0.1),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(size: 18),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Nível",
                    labelStyle: TextStyle(),
                  ),
                ),
                TextField(
                  controller: controller.txt,
                  onChanged: controller.getData,
                  obscureText: false,
                  keyboardType: TextInputType.datetime,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: sizeConfig.dynamicScaleSize(size: 18),
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(MyIcons.date,
                        color: Colors.red, size: _width * 0.1),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(size: 18),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Data",
                    labelStyle: TextStyle(),
                  ),
                ),
                TextField(
                  onChanged: controller.getPreco,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    fontFamily: 'Robot',
                    fontSize: sizeConfig.dynamicScaleSize(size: 18),
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(MyIcons.price,
                        color: Colors.red, size: _width * 0.1),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(size: 18),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Preço",
                    labelStyle: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: sizeConfig.dynamicScaleSize(size: 10),
                )
              ],
            ),
            SizedBox(
              height: sizeConfig.dynamicScaleSize(size: 10),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCustom(
                    text: "Confirmar",
                    onclick: () {
                      controller.update();
                      Navigator.pop(context);
                    },
                    width: sizeConfig.dynamicScaleSize(size: 175),
                  ),
                  ButtonCustom(
                    text: "Cancelar",
                    onclick: () {
                      Navigator.pop(context);
                    },
                    width: sizeConfig.dynamicScaleSize(size: 175),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
