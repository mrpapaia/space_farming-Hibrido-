import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/containerBase.dart';
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
  var aa;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    var flag = false;
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
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Modular.to
                        .pushNamed('/home', arguments: controller.user.data[0]);
                  });
                }
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
                    ButtonCustom(
                      text: "Login",
                      width: 309.0,
                      onclick: () async {
                        await controller.login(_auth).then((value) {
                          if (value != null) {
                            aa = value;
                          }
                        });
                      },
                    ),
                  ],
                );
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Text("Não possui conta?"),
            onTap: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Modular.to.pushNamed('/login/cadastro');
              });
            },
          ),
        ],
      ),
    );
  }
}
