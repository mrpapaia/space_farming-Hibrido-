import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';

import 'package:space_farming_modular/app/shared/components/cardEditText.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import '../../shared/models/user.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  UserP user;
  LoginPage({Key key, this.title = "Login", this.user}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  bool press = false;
  String teste;
  var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    print(MediaQuery.of(context).size.shortestSide);
    if (_auth.currentUser != null) {
      controller.getUser(_auth.currentUser.email);
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Image(
              image: AssetImage('lib/app/shared/graphics/logo.png'),
              width: sizeConfig.dynamicScaleSize(
                  size: 309,
                  scaleFactorMini: 0.725,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
              height: sizeConfig.dynamicScaleSize(
                  size: 178,
                  scaleFactorMini: 0.725,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
          ),
          Observer(
            builder: (BuildContext context) {
              try {
                if (controller.user.data != null) {
                  return AlertDialog(
                    content: Text(
                        "Logado com sucesso!!\nBem Vindo ${controller.user.data[0].nome}"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/home',
                              arguments: [controller.user.data[0], _auth]);
                        },
                      ),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              } catch (NoSuchMethodError) {
                return Column(
                  children: [
                    SizedBox(
                      height: sizeConfig.dynamicScaleSize(
                          size: 10,
                          scaleFactorMini: 0.725,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                    ),
                    Center(
                      child: CardEditText(
                        child: TextField(
                          controller: null,
                          onChanged: controller.getEmail,
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
                            prefixIcon: Icon(
                              MyIcons.user,
                              color: Colors.red,
                              size: sizeConfig.dynamicScaleSize(
                                  size: 50,
                                  scaleFactorMini: 0.725,
                                  scaleFactorTablet: 0,
                                  scaleFactorNormal: 1),
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: sizeConfig.dynamicScaleSize(
                                  size: 18,
                                  scaleFactorMini: 0.725,
                                  scaleFactorTablet: 0,
                                  scaleFactorNormal: 1),
                              color: Color.fromRGBO(113, 111, 137, 1.0),
                            ),
                            labelText: "E-mail",
                            labelStyle: TextStyle(),
                          ),
                        ),
                        width: sizeConfig.dynamicScaleSize(
                            size: _width,
                            scaleFactorMini: 1,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
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
                        controller: null,
                        onChanged: controller.getPasswd,
                        obscureText: true,
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
                          prefixIcon: Icon(
                            MyIcons.password,
                            color: Colors.red,
                            size: sizeConfig.dynamicScaleSize(
                                size: 50,
                                scaleFactorMini: 0.725,
                                scaleFactorTablet: 0,
                                scaleFactorNormal: 1),
                          ),
                          hintStyle: TextStyle(
                            fontFamily: 'Robot',
                            fontSize: sizeConfig.dynamicScaleSize(
                                size: 18,
                                scaleFactorMini: 0.725,
                                scaleFactorTablet: 0,
                                scaleFactorNormal: 1),
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          labelText: "Senha",
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
                    ButtonCustom(
                      text: "Login",
                      width: sizeConfig.dynamicScaleSize(
                          size: _width,
                          scaleFactorMini: 0.8,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 0.8),
                      onclick: () async {
                        await controller.login(_auth, context);
                      },
                    ),
                    SizedBox(
                      height: sizeConfig.dynamicScaleSize(
                          size: 10,
                          scaleFactorMini: 0.725,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                    ),
                    InkWell(
                      child: Text(
                        "Não possui conta?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: sizeConfig.dynamicScaleSize(
                                size: 16,
                                scaleFactorMini: 0.725,
                                scaleFactorTablet: 0,
                                scaleFactorNormal: 1)),
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/login/cadastro');
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
