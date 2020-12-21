import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/editText.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'abastecer_controller.dart';

class AbastecerPage extends StatefulWidget {
  final String title;
  AbastecerPage({Key key, this.title = "Abastecer", this.user, this.botijao})
      : super(key: key);
  UserP user;
  Botijao botijao;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            100,
          ),
          child: SecAppBar()),
      drawer: NavigationDrawer(),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleOfScreen(
              title: "Abastecer",
              font: "Revalia",
              fontSize: _width * 0.09,
            ),
            SizedBox(
              height: 10,
            ),
            /*
            TitleOfScreen(
              title: "Fornecedor",
              font: "Robot",
              fontSize: 32,
            ),
            SizedBox(
              height: 10,
            ),
            ContainerBase(componets: <Widget>[
              EditText(
                  hint: "Nome", icon: Icon(Icons.person, color: Colors.red)),
              EditText(
                  hint: "Telefone", icon: Icon(Icons.phone, color: Colors.red)),
              EditText(
                hint: "Endereço",
                icon: Icon(Icons.attach_money, color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
            SizedBox(
              height: 10,
            ),*/

            SizedBox(
              height: 10,
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
                    fontSize: 18,
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(MyIcons.volume,
                        color: Colors.red, size: _width * 0.1),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 18,
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
                    fontSize: 18,
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(MyIcons.date,
                        color: Colors.red, size: _width * 0.1),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 18,
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
                    fontSize: 18,
                    color: Color.fromRGBO(113, 111, 137, 1.0),
                  ),
                  decoration: InputDecoration(
                    icon: Icon(MyIcons.price,
                        color: Colors.red, size: _width * 0.1),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 18,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Preço",
                    labelStyle: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCustom(
                    text: "Confirmar",
                    onclick: () {
                      controller.update(widget.botijao.idBot,
                          widget.botijao.volAtual, widget.user);
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
      ),
    );
  }
}
