import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/components/container_caneca.dart';
import 'package:space_farming_modular/app/shared/components/caneca_icons_icons.dart';

import 'package:space_farming_modular/app/shared/components/my_icons2_icons.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

import 'home_info_bot_controller.dart';

class HomeInfoBotPage extends StatefulWidget {
  final String title;
  Botijao botijao;
  UserP user;
  HomeInfoBotPage({Key key, this.title, this.botijao, this.user})
      : super(key: key);

  @override
  _HomeInfoBotPageState createState() => _HomeInfoBotPageState();
}

class _HomeInfoBotPageState
    extends ModularState<HomeInfoBotPage, HomeInfoBotController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;

    double _height = MediaQuery.of(context).size.height;
    String imgSrc = '';
    switch (widget.botijao.numcanecas) {
      case 2:
        imgSrc = 'lib/app/shared/graphics/test3.svg';

        break;
      case 4:
        imgSrc = 'lib/app/shared/graphics/botijao4.png';
        break;
      case 6:
        imgSrc = 'lib/app/shared/graphics/botijao6.png';
        break;
      case 8:
        imgSrc = 'lib/app/shared/graphics/botijao8.png';
        break;
      case 10:
        imgSrc = 'lib/app/shared/graphics/botijao10.png';
        break;
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            100,
          ),
          child: SecAppBar()),
      drawer: NavigationDrawer(),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              child: Center(
                child: Text(
                  "Botijão ${widget.botijao.idBot}",
                  style: TextStyle(
                    fontFamily: "Robot",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              width: _width * 0.9,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(126, 116, 116, 1.0), width: 5),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: Offset(5, 5),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.05,
          ),
          Observer(builder: (_) {
            return Container(
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: _width * 0.95,
                        height: _height * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(
                              color: Color.fromRGBO(126, 116, 116, 1.0),
                              width: 5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0.2,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Center(
                          child: Text(
                            "${widget.botijao.volAtual}",
                            style: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: _width * 0.1,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(126, 116, 116, 1.0),
                              width: 5),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromRGBO(229, 231, 236, 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num1,
                        color: Colors.grey,
                      ),
                      top: _height * 0.192,
                      left: _width * 0.1,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num2,
                        color: Colors.grey,
                      ),
                      top: _height * 0.185,
                      left: _width * 0.65,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num3,
                        color: Colors.grey,
                      ),
                      top: _height * 0.02,
                      left: _width * 0.37,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num5,
                        color: Colors.grey,
                      ),
                      top: _height * 0.03,
                      left: _width * 0.185,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num5,
                        color: Colors.grey,
                      ),
                      top: _height * 0.11,
                      left: _width * 0.1,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num7,
                        color: Colors.grey,
                      ),
                      top: _height * 0.028,
                      left: _width * 0.55,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num6,
                        color: Colors.grey,
                      ),
                      top: _height * 0.1,
                      left: _width * 0.65,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num4,
                        color: Colors.grey,
                      ),
                      top: _height * 0.28,
                      left: _width * 0.37,
                    ),
                    Positioned(
                      child: ContainerCaneca(
                        icon: CanecaIcons.num4,
                        color: Colors.grey,
                      ),
                      top: _height * 0.26,
                      left: _width * 0.56,
                    ),
                    widget.botijao.numcanecas >= 2
                        ? Positioned(
                            child: ContainerCaneca(
                              icon: CanecaIcons.num8,
                              color: Colors.grey,
                            ),
                            top: _height * 0.27,
                            left: _width * 0.18,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                  ],
                ),
              ),
              width: _width * 0.95,
              height: _height * 0.4,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(126, 116, 116, 1.0), width: 5),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: Offset(5, 5),
                  )
                ],
              ),

              /* onTap: () {
                Modular.to.pushNamed('/rack',
                    arguments: [widget.botijao.canecas[0], widget.user]);
              },*/
            );
          }),
          SizedBox(
            height: _height * 0.05,
          ),
          TitleOfScreen(
            title: "Régua",
            font: "Revalia",
            fontSize: _width * 0.09,
          ),
          SizedBox(
            height: _height * 0.03,
          ),
          InkWell(
            child: Container(
              child: Stack(
                children: [
                  InkWell(
                    child: Image(
                      image: AssetImage("lib/app/shared/graphics/regua.png"),
                    ),
                    onTap: () {
                      Modular.to.pushNamed('/ctrl',
                          arguments: [widget.botijao, widget.user]);
                    },
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.transparent,
                      inactiveTrackColor: Colors.transparent,
                      thumbColor: Colors.black,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10,
                      ),
                      overlayColor: Colors.red.withAlpha(0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 3.0),
                    ),
                    child: Slider(
                      value: widget.botijao.volAtual,
                      min: 0,
                      max: 45,
                      onChanged: (value) {
                        value = value;
                      },
                    ),
                  ),
                ],
              ),
              width: _width - 30,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromRGBO(126, 116, 116, 1.0), width: 5),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: Offset(5, 5),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
