import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
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
        imgSrc = 'lib/app/shared/graphics/botijao2.png';
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
            return InkWell(
              child: Container(
                child: Image(
                  image: AssetImage(imgSrc),
                ),
                width: _width * 0.9,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
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
              onTap: () {
                Modular.to.pushNamed('/rack',
                    arguments: [widget.botijao.canecas[0], widget.user]);
              },
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
