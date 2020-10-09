import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'home_info_bot_controller.dart';

class HomeInfoBotPage extends StatefulWidget {
  final String title;
  Botijao botijao;
  HomeInfoBotPage({
    Key key,
    this.title,
    this.botijao,
  }) : super(key: key);

  @override
  _HomeInfoBotPageState createState() => _HomeInfoBotPageState();
}

class _HomeInfoBotPageState
    extends ModularState<HomeInfoBotPage, HomeInfoBotController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    print(widget.botijao.ref);
    controller.getCanecas(widget.botijao.ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Observer(builder: (BuildContext context) {
            print(controller.listCanecas.data);
            return Center(
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
                width: _width - 100,
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
            );
          }),
          Container(
            child: Image(
              image: AssetImage(imgSrc),
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
          TitleOfScreen(
            title: "Régua",
            font: "Revalia",
            fontSize: 34,
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
                      Modular.to.pushNamed('/ctrl', arguments: widget.botijao);
                    },
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.transparent,
                      inactiveTrackColor: Colors.transparent,
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 5.0,
                      thumbColor: Colors.black,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 5,
                      ),
                      overlayColor: Colors.red.withAlpha(0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 3.0),
                    ),
                    child: Slider(
                      value: 0,
                      min: 0,
                      max: 100,
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
