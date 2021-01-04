import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
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

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    double hBot = _height > 700 ? 0.07 : 0.08;
    double wBot = _height > 700 ? 0.155 : 0.15;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: sizeConfig.dynamicScaleSize(size: 10),
          ),
          Center(
            child: Container(
              child: Center(
                child: Text(
                  "Botijão ${controller.botijao.idBot}",
                  style: TextStyle(
                    fontFamily: "Robot",
                    fontSize: sizeConfig.dynamicScaleSize(size: 35),
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              width: sizeConfig.dynamicScaleSize(size: 370),
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
            height: sizeConfig.dynamicScaleSize(size: 30),
          ),
          Container(
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: sizeConfig.dynamicScaleSize(size: 370),
                      height: sizeConfig.dynamicScaleSize(size: 370),
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
                              fontSize: sizeConfig.dynamicScaleSize(size: 25),
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        width: sizeConfig.dynamicScaleSize(size: 100),
                        height: sizeConfig.dynamicScaleSize(size: 100),
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
                  controller.botijao.numcanecas >= 8
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas[9].id.id,
                              color: controller.botijao.canecas[9].color,
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
                          bottom: sizeConfig.dynamicScaleSize(size: 70),
                          left: sizeConfig.dynamicScaleSize(size: 50),
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
                              id: controller.botijao.canecas[6].id.id,
                              color: controller.botijao.canecas[6].color,
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
                          bottom: sizeConfig.dynamicScaleSize(size: 70),
                          right: sizeConfig.dynamicScaleSize(size: 50),
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
                              id: controller.botijao.canecas[2].id.id,
                              color: controller.botijao.canecas[2].color,
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
                          top: sizeConfig.dynamicScaleSize(size: 25),
                          left: sizeConfig.dynamicScaleSize(size: 110),
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
                              id: controller.botijao.canecas[7].id.id,
                              color: controller.botijao.canecas[7].color,
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
                          top: sizeConfig.dynamicScaleSize(size: 70),
                          left: sizeConfig.dynamicScaleSize(size: 50),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  Positioned(
                    child: InkWell(
                      child: ContainerCaneca(
                        flag: false,
                        id: controller.botijao.canecas[0].id.id,
                        color: controller.botijao.canecas[0].color,
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
                    top: sizeConfig.dynamicScaleSize(size: 140),
                    left: sizeConfig.dynamicScaleSize(size: 25),
                  ),
                  controller.botijao.numcanecas >= 4
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas[4].id.id,
                              color: controller.botijao.canecas[4].color,
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
                          top: sizeConfig.dynamicScaleSize(size: 25),
                          right: sizeConfig.dynamicScaleSize(size: 110),
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
                              id: controller.botijao.canecas[8].id.id,
                              color: controller.botijao.canecas[8].color,
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
                          top: sizeConfig.dynamicScaleSize(size: 70),
                          right: sizeConfig.dynamicScaleSize(size: 50),
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
                              id: controller.botijao.canecas[1].id.id,
                              color: controller.botijao.canecas[1].color,
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
                          top: sizeConfig.dynamicScaleSize(size: 140),
                          right: sizeConfig.dynamicScaleSize(size: 25),
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
                              id: controller.botijao.canecas[3].id.id,
                              color: controller.botijao.canecas[3].color,
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
                          bottom: sizeConfig.dynamicScaleSize(size: 25),
                          right: sizeConfig.dynamicScaleSize(size: 110),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  controller.botijao.numcanecas >= 4
                      ? Positioned(
                          child: InkWell(
                            child: ContainerCaneca(
                              flag: false,
                              id: controller.botijao.canecas[5].id.id,
                              color: controller.botijao.canecas[5].color,
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
                          bottom: sizeConfig.dynamicScaleSize(size: 25),
                          left: sizeConfig.dynamicScaleSize(size: 110),
                        )
                      : SizedBox(
                          width: 0,
                          height: 0,
                        ),
                ],
              ),
            ),
            width: sizeConfig.dynamicScaleSize(size: 370),
            height: sizeConfig.dynamicScaleSize(size: 350),
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
            height: _height > 700 ? _height * 0.05 : _height * 0.03,
          ),
          TitleOfScreen(
            title: "Régua",
            font: "Revalia",
            fontSize: _width * 0.09,
          ),
          SizedBox(
            height: _height > 700 ? _height * 0.04 : _height * 0.03,
          ),
          Container(
            width: sizeConfig.dynamicScaleSize(size: 370),
            child: Stack(
              children: [
                Positioned(
                  top: 1,
                  left: 22,
                  child: Container(
                    width: sizeConfig.dynamicScaleSize(size: 310),
                    height: 50,
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
