import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/hexcolor.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/components/container_caneca.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/components/longPressCaneca.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/components/thumb.dart';

import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'home_info_bot_controller.dart';

class HomeInfoBotPage extends StatefulWidget {
  final String title;

  HomeInfoBotPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HomeInfoBotPageState createState() => _HomeInfoBotPageState();
}

class _HomeInfoBotPageState
    extends ModularState<HomeInfoBotPage, HomeInfoBotController> {
  //use 'controller' variable to access controller
  Color currentColor = Colors.limeAccent;

  String toHex(Color color) => "#" + color.value.toRadixString(16).substring(2);
  void startTimer() {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    double hBot = _height > 700 ? 0.07 : 0.08;
    double wBot = _height > 700 ? 0.155 : 0.15;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    startTimer();

    return Scaffold(
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(sizeConfig.dynamicScaleSize(
            size: 70,
            scaleFactorMini: 0.8,
            scaleFactorTablet: 0,
            scaleFactorNormal: 1)),
      ),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          Center(
            child: Container(
              child: Center(
                child: Text(
                  "Botijão ${controller.botijao.idBot}",
                  style: TextStyle(
                    fontFamily: "Robot",
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 35,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              width: sizeConfig.dynamicScaleSize(
                  size: 370,
                  scaleFactorMini: 0.725,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
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
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          Container(
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: sizeConfig.dynamicScaleSize(
                          size: 370,
                          scaleFactorMini: 0.725,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      height: sizeConfig.dynamicScaleSize(
                          size: 370,
                          scaleFactorMini: 0.725,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        border: Border.all(
                          color: Color.fromRGBO(126, 116, 116, 1.0),
                          width: 5,
                        ),
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
                    child: InkWell(
                      child: Container(
                        child: Center(
                          child: Text(
                            "${controller.botijao.volAtual.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontFamily: 'Robot',
                              fontSize: sizeConfig.dynamicScaleSize(
                                  size: 25,
                                  scaleFactorMini: 0.725,
                                  scaleFactorTablet: 0,
                                  scaleFactorNormal: 1),
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        width: sizeConfig.dynamicScaleSize(
                            size: 100,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        height: sizeConfig.dynamicScaleSize(
                            size: 100,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(126, 116, 116, 1.0),
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromRGBO(229, 231, 236, 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.02),
                              spreadRadius: 0,
                              offset: Offset(5, 5),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/ctrl',
                            arguments: [controller.botijao, controller.user]);
                      },
                    ),
                  ),
                  controller.botijao.numcanecas >= 10
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "10"
                                  : controller.botijao.canecas[9].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[9].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[9],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 9,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          bottom: sizeConfig.dynamicScaleSize(
                              size: 70,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          left: sizeConfig.dynamicScaleSize(
                              size: 50,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 8
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "7"
                                  : controller.botijao.canecas[6].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[6].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[6],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 6,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          bottom: sizeConfig.dynamicScaleSize(
                              size: 70,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          right: sizeConfig.dynamicScaleSize(
                              size: 50,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 6
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "3"
                                  : controller.botijao.canecas[2].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[2].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[2],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Color cor;
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 2,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          top: sizeConfig.dynamicScaleSize(
                              size: 25,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          left: sizeConfig.dynamicScaleSize(
                              size: 110,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 8
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "8"
                                  : controller.botijao.canecas[7].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[7].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[7],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 7,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          top: sizeConfig.dynamicScaleSize(
                              size: 70,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          left: sizeConfig.dynamicScaleSize(
                              size: 50,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  Positioned(
                    child: InkWell(
                      child: ContainerCaneca(
                        flag: false,
                        id: controller.botijao.canecas.isEmpty
                            ? "1"
                            : controller.botijao.canecas[0].id.id,
                        color: controller.botijao.canecas.isEmpty
                            ? HexColor("#adadad")
                            : controller.botijao.canecas[0].color,
                        h: hBot,
                        w: wBot,
                      ),
                      onTap: () {
                        Modular.to.pushNamed('/rack', arguments: [
                          controller.botijao.canecas[0],
                          controller.user
                        ]);
                      },
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Color cor;
                            return LongPressCaneca(
                              h: hBot,
                              w: wBot,
                              index: 0,
                              controller: controller,
                            );
                          },
                        );
                      },
                    ),
                    top: sizeConfig.dynamicScaleSize(
                        size: 140,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    left: sizeConfig.dynamicScaleSize(
                        size: 25,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  controller.botijao.numcanecas >= 6
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "5"
                                  : controller.botijao.canecas[4].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[4].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[4],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Color cor;
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 4,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          top: sizeConfig.dynamicScaleSize(
                              size: 25,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          right: sizeConfig.dynamicScaleSize(
                              size: 110,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 10
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "9"
                                  : controller.botijao.canecas[8].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[8].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[8],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Color cor;
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 8,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          top: sizeConfig.dynamicScaleSize(
                              size: 70,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          right: sizeConfig.dynamicScaleSize(
                              size: 50,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 2
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "2"
                                  : controller.botijao.canecas[1].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[1].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[1],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 1,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          top: sizeConfig.dynamicScaleSize(
                              size: 140,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          right: sizeConfig.dynamicScaleSize(
                              size: 25,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 6
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "4"
                                  : controller.botijao.canecas[3].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[3].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[3],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Color cor;
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 3,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          bottom: sizeConfig.dynamicScaleSize(
                              size: 25,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          right: sizeConfig.dynamicScaleSize(
                              size: 110,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 6
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas.isEmpty
                                  ? "6"
                                  : controller.botijao.canecas[5].id.id,
                              color: controller.botijao.canecas.isEmpty
                                  ? HexColor("#adadad")
                                  : controller.botijao.canecas[5].color,
                              h: hBot,
                              w: wBot,
                            ),
                            onTap: () {
                              Modular.to.pushNamed('/rack', arguments: [
                                controller.botijao.canecas[5],
                                controller.user
                              ]);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Color cor;
                                  return LongPressCaneca(
                                    h: hBot,
                                    w: wBot,
                                    index: 5,
                                    controller: controller,
                                  );
                                },
                              );
                            },
                          ),
                          bottom: sizeConfig.dynamicScaleSize(
                              size: 25,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                          left: sizeConfig.dynamicScaleSize(
                              size: 110,
                              scaleFactorMini: 0.725,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                ],
              ),
            ),
            width: sizeConfig.dynamicScaleSize(
                size: 370,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
            height: sizeConfig.dynamicScaleSize(
                size: 350,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
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
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          TitleOfScreen(
            title: "Régua",
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(
                size: 30,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 8,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          Container(
            width: sizeConfig.dynamicScaleSize(
                size: 370,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
            child: Stack(
              children: [
                Positioned(
                  top: 1,
                  left: 22,
                  child: Container(
                    width: sizeConfig.dynamicScaleSize(
                        size: 310,
                        scaleFactorMini: 0.67,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    height: sizeConfig.dynamicScaleSize(
                        size: 50,
                        scaleFactorMini: 1,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/app/shared/graphics/regua.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: controller.botijao.volAtual < 15
                        ? Colors.red
                        : controller.botijao.volAtual < 25
                            ? Colors.yellow
                            : Colors.green,
                    inactiveTrackColor: Colors.white.withOpacity(0.8),
                    thumbColor: Colors.black,
                    thumbShape: CustomSliderThumbRect(
                      thumbRadius: 48 * .04,
                      thumbHeight: 40,
                      min: 0,
                      max: 51,
                    ),
                    overlayColor: Colors.white.withOpacity(.4),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.black,
                  ),
                  child: Slider(
                    value: controller.botijao.volAtual,
                    min: 0,
                    max: 51,
                    onChangeEnd: (value) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
                            content: Container(
                              height: sizeConfig.dynamicScaleSize(
                                  size: 150,
                                  scaleFactorMini: 0.725,
                                  scaleFactorTablet: 0,
                                  scaleFactorNormal: 1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                        size: sizeConfig.dynamicScaleSize(
                                            size: 50,
                                            scaleFactorMini: 0.725,
                                            scaleFactorTablet: 0,
                                            scaleFactorNormal: 1),
                                      ),
                                      SizedBox(
                                        width: sizeConfig.dynamicScaleSize(
                                            size: 10,
                                            scaleFactorMini: 0.725,
                                            scaleFactorTablet: 0,
                                            scaleFactorNormal: 1),
                                      ),
                                      Text(
                                        "Cuidado!!",
                                        style: TextStyle(
                                            fontFamily: 'Revalia',
                                            fontSize:
                                                sizeConfig.dynamicScaleSize(
                                                    size: 25,
                                                    scaleFactorMini: 0.725,
                                                    scaleFactorTablet: 0,
                                                    scaleFactorNormal: 1),
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 16,
                                            scaleFactorMini: 0.725,
                                            scaleFactorTablet: 0,
                                            scaleFactorNormal: 1),
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: '\nNível do botijão'),
                                        TextSpan(
                                            text:
                                                ' ${controller.botijao.idBot}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(text: ' foi alterado!!\n\n'),
                                        TextSpan(
                                            text:
                                                'Por favor informe o tipo de alteração?'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "Abastecimento",
                                  style: TextStyle(
                                      fontSize: sizeConfig.dynamicScaleSize(
                                          size: 14,
                                          scaleFactorMini: 0.65,
                                          scaleFactorTablet: 0,
                                          scaleFactorNormal: 1),
                                      color: Colors.red,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  controller.abastecer();
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text(
                                  "Medição",
                                  style: TextStyle(
                                      fontSize: sizeConfig.dynamicScaleSize(
                                          size: 14,
                                          scaleFactorMini: 0.65,
                                          scaleFactorTablet: 0,
                                          scaleFactorNormal: 1),
                                      color: Colors.red,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  controller.medirNivel();

                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text(
                                  "Cancelar",
                                  style: TextStyle(
                                      fontSize: sizeConfig.dynamicScaleSize(
                                          size: 14,
                                          scaleFactorMini: 0.65,
                                          scaleFactorTablet: 0,
                                          scaleFactorNormal: 1),
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  setState(() {
                                    controller.botijao.volAtual =
                                        controller.volAnterior;
                                  });

                                  Modular.to.pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          controller.getNivel(value);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Color.fromRGBO(126, 116, 116, 1.0), width: 5),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(5, 5),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
