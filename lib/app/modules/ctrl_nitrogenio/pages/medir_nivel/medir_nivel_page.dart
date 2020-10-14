import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/editText.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'medir_nivel_controller.dart';

class MedirNivelPage extends StatefulWidget {
  final String title;
  MedirNivelPage({Key key, this.title = "MedirNivel", this.user, this.botijao})
      : super(key: key);
  UserP user;
  Botijao botijao;

  @override
  _MedirNivelPageState createState() => _MedirNivelPageState();
}

class _MedirNivelPageState
    extends ModularState<MedirNivelPage, MedirNivelController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
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
              title: "Medir Nível",
              font: "Revalia",
              fontSize: 32,
            ),
            /*  TitleOfScreen(
              title: "Responsavel",
              font: "Robot",
              fontSize: 32,
            ),*/
            SizedBox(
              height: 10,
            ),
            /* ContainerBase(
              componets: <Widget>[
                EditText(
                    hint: "Nome", icon: Icon(Icons.person, color: Colors.red)),
                EditText(
                    hint: "E-mail", icon: Icon(Icons.email, color: Colors.red)),
                EditText(
                    hint: "Telefone",
                    icon: Icon(Icons.phone, color: Colors.red)),
                SizedBox(
                  height: 10,
                )
              ],
            ),*/
            SizedBox(
              height: 10,
            ),
            /*  TitleOfScreen(
              title: "Nitrogênio",
              font: "Robot",
              fontSize: 32,
            ),*/
            ContainerBase(
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
                    icon: Icon(Icons.poll, color: Colors.red),
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
                    icon: Icon(Icons.calendar_today, color: Colors.red),
                    hintStyle: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: 18,
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    labelText: "Data",
                    labelStyle: TextStyle(),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonCustom(
                    text: "Confirmar",
                    onclick: () {
                      controller.update(widget.botijao.idBot, widget.user);
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
      ),
    );
  }
}
