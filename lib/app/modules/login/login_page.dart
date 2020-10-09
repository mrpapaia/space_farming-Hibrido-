import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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
  void startTimer() {
    new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (controller.farm.data != null) {
            controller.isSuccefull(controller.farm.data[0].ref);
            timer.cancel();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Observer(
            builder: (BuildContext context) {
              try {
                controller.farm.data;
                return Center(child: CircularProgressIndicator());
              } catch (NoSuchMethodError) {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          RaisedButton(onPressed: () {
            controller.getUser('test@gmail.com');
            startTimer();
          }),
        ],
      ),
    );
  }
}
