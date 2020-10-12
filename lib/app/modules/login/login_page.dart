import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:space_farming_modular/app/shared/components/cardEditText.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/editText.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  bool press = false;
  String teste;

  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (controller.farm.data != null && controller.user.data != null) {
            controller.isSuccefull(
                controller.farm.data[0].ref, controller.user.data[0]);
            timer.cancel();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Image(
              image: AssetImage('lib/app/shared/graphics/logo.png'),
              width: 309,
              height: 178,
            ),
          ),
          Observer(
            builder: (BuildContext context) {
              try {
                controller.farm.data;
                controller.user.data;

                return Center(child: CircularProgressIndicator());
              } catch (NoSuchMethodError) {
                return Column(
                  children: [
                    Center(
                      child: ContainerBase(
                        height: 180,
                        componets: [
                          TextField(
                            onChanged: controller.getEmail,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.red,
                            //validator: controller.valideteEmail,
                            style: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: 18,
                              color: Color.fromRGBO(113, 111, 137, 1.0),
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.mail,
                                color: Colors.red,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Robot',
                                fontSize: 18,
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
                              fontSize: 18,
                              color: Color.fromRGBO(113, 111, 137, 1.0),
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Robot',
                                fontSize: 18,
                                color: Color.fromRGBO(113, 111, 137, 1.0),
                              ),
                              labelText: "Senha",
                              labelStyle: TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          RaisedButton(onPressed: () {
            controller.getUser(controller.email);

            startTimer();
          }),
        ],
      ),
    );
  }
}
