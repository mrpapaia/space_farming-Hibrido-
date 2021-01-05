import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/components/button.dart';
import '../../../../shared/components/containerBase.dart';
import '../../../../shared/components/titleOfScreen.dart';
import '../../../home/components/secondaryAppBar.dart';
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

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
        appBar: SecAppBar(
          preferredSize: Size.fromHeight(70.0),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TitleOfScreen(
                title: "Cadastro",
                font: "Revalia",
                fontSize: _width * 0.09,
              ),
              Column(
                children: [
                  SizedBox(
                    height: _height * 0.025,
                  ),
                  Center(
                    child: ContainerBase(
                      height: _height * 0.22,
                      width: _width,
                      componets: [
                        TextField(
                          onChanged: controller.getEmail,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.red,
                          style: TextStyle(
                            fontFamily: 'Robot',
                            fontSize: _width * 0.045,
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.red,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.045,
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
                            fontSize: _width * 0.045,
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.red,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.045,
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
                    height: _height * 0.02,
                  ),
                  Center(
                    child: ContainerBase(
                      width: _width,
                      height: _height * 0.4,
                      componets: [
                        TextField(
                          onChanged: controller.getFazenda,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.red,
                          style: TextStyle(
                            fontFamily: 'Robot',
                            fontSize: _width * 0.045,
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.red,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.045,
                              color: Color.fromRGBO(113, 111, 137, 1.0),
                            ),
                            labelText: "Nome da Fazenda",
                            labelStyle: TextStyle(),
                          ),
                        ),
                        TextField(
                          onChanged: controller.getNome,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.red,
                          style: TextStyle(
                            fontFamily: 'Robot',
                            fontSize: _width * 0.045,
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.red,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.045,
                              color: Color.fromRGBO(113, 111, 137, 1.0),
                            ),
                            labelText: "Nome",
                            labelStyle: TextStyle(),
                          ),
                        ),
                        TextField(
                          onChanged: controller.getCpf,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.red,
                          style: TextStyle(
                            fontFamily: 'Robot',
                            fontSize: _width * 0.045,
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.red,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.045,
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
                            fontSize: _width * 0.05,
                            color: Color.fromRGBO(113, 111, 137, 1.0),
                          ),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.red,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.05,
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
                    height: _height * 0.02,
                  ),
                  ButtonCustom(
                    text: "Cadastrar",
                    width: 309.0,
                    onclick: () async {
                      await controller.singIn();
                      print("foi");
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
