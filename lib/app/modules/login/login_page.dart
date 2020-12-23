import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';

import 'package:space_farming_modular/app/shared/components/cardEditText.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
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
                      height: _height * 0.015,
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
                            fontSize: _width * 0.05,
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
                            prefixIcon: Icon(MyIcons.user,
                                color: Colors.red, size: _width * 0.125),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.05,
                              color: Color.fromRGBO(113, 111, 137, 1.0),
                            ),
                            labelText: "E-mail",
                            labelStyle: TextStyle(),
                          ),
                        ),
                        width: _width,
                      ),
                    ),
                    SizedBox(
                      height: _height * 0.015,
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
                          fontSize: _width * 0.05,
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
                          prefixIcon: Icon(MyIcons.password,
                              color: Colors.red, size: _width * 0.12),
                          hintStyle: TextStyle(
                            fontFamily: 'Robot',
                            fontSize: _width * 0.05,
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          labelText: "Senha",
                          labelStyle: TextStyle(),
                        ),
                      ),
                      width: _width,
                    ),
                    SizedBox(
                      height: _height * 0.015,
                    ),
                    ButtonCustom(
                      text: "Login",
                      width: 309.0,
                      onclick: () async {
                        await controller.login(_auth);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text("Não possui conta?"),
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
