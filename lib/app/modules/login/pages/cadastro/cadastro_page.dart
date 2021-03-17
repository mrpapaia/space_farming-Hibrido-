import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';

import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;

    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    var auth = FirebaseAuth.instance;

    return Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TitleOfScreen(
              title: "Cadastro",
              font: "Revalia",
              fontSize: sizeConfig.dynamicScaleSize(
                  size: 35,
                  scaleFactorMini: 0.65,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            SizedBox(
              height: sizeConfig.dynamicScaleSize(
                  size: 10,
                  scaleFactorMini: 0.65,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            Center(
              child: ContainerBase(
                height: sizeConfig.dynamicScaleSize(
                    size: 150,
                    scaleFactorMini: 0.8,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
                width: sizeConfig.dynamicScaleSize(
                    size: _width,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
                componets: [
                  TextField(
                    onChanged: controller.getEmail,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.red,
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.65,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.65,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        color: Color.fromRGBO(113, 111, 137, 1.0),
                      ),
                      labelText: "E-mail",
                      labelStyle: TextStyle(),
                    ),
                  ),
                  TextField(
                    onChanged: controller.getPasswd,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.red,
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.65,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.65,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        color: Color.fromRGBO(113, 111, 137, 1.0),
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeConfig.dynamicScaleSize(
                  size: 5,
                  scaleFactorMini: 0.65,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            Center(
              child: ContainerBase(
                width: sizeConfig.dynamicScaleSize(
                    size: _width,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
                height: sizeConfig.dynamicScaleSize(
                    size: 285,
                    scaleFactorMini: 0.75,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
                componets: [
                  TextField(
                    onChanged: controller.getFazenda,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.red,
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.65,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        MyIcons.farm,
                        color: Colors.red,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.65,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        color: Color.fromRGBO(113, 111, 137, 1.0),
                      ),
                      labelText: "Nome da Fazenda",
                      labelStyle: TextStyle(),
                    ),
                  ),
                  TextField(
                    onChanged: controller.getNome,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.red,
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.65,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        MyIcons.user,
                        color: Colors.red,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.65,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        color: Color.fromRGBO(113, 111, 137, 1.0),
                      ),
                      labelText: "Nome",
                      labelStyle: TextStyle(),
                    ),
                  ),
                  TextField(
                    onChanged: controller.getCpf,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.red,
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.65,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.credit_card,
                        color: Colors.red,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.65,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        color: Color.fromRGBO(113, 111, 137, 1.0),
                      ),
                      labelText: "CPF/CNPJ",
                      labelStyle: TextStyle(),
                    ),
                  ),
                  TextField(
                    onChanged: controller.getTelefone,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.red,
                    style: TextStyle(
                      fontFamily: 'Robot',
                      fontSize: sizeConfig.dynamicScaleSize(
                          size: 18,
                          scaleFactorMini: 0.65,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      color: Color.fromRGBO(113, 111, 137, 1.0),
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Robot',
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 0.65,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        color: Color.fromRGBO(113, 111, 137, 1.0),
                      ),
                      labelText: "Telefone",
                      labelStyle: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeConfig.dynamicScaleSize(
                  size: 10,
                  scaleFactorMini: 0.65,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            ButtonCustom(
              text: "Cadastrar",
              width: sizeConfig.dynamicScaleSize(
                  size: _width,
                  scaleFactorMini: 0.65,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
              onclick: () async {
                if (controller.verificar()) {
                  controller.singIn(auth).then((value) {});
                  Modular.to.pop();
                } else {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("CPF/CNPJ invalido"),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height -
                              sizeConfig.dynamicScaleSize(
                                  size: 75,
                                  scaleFactorMini: 0.8,
                                  scaleFactorTablet: 0,
                                  scaleFactorNormal: 1)),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
