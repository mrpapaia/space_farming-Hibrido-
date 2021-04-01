import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'ctrl_colaboradores_controller.dart';

class CtrlColaboradoresPage extends StatefulWidget {
  final String title;
  const CtrlColaboradoresPage({Key key, this.title = "CtrlColaboradores"})
      : super(key: key);

  @override
  _CtrlColaboradoresPageState createState() => _CtrlColaboradoresPageState();
}

class _CtrlColaboradoresPageState
    extends ModularState<CtrlColaboradoresPage, CtrlColaboradoresController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    var _width = MediaQuery.of(context).size.width - 30;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      body: Container(
        height: sizeConfig.dynamicScaleSize(
            size: 750,
            scaleFactorMini: 0.725,
            scaleFactorTablet: 0,
            scaleFactorNormal: 1),
        child: Column(
          children: [
            TitleOfScreen(
              title: "Colaboradores",
              font: "Revalia",
              fontSize: sizeConfig.dynamicScaleSize(
                  size: 30,
                  scaleFactorMini: 0.75,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            SizedBox(
              height: sizeConfig.dynamicScaleSize(
                  size: 25,
                  scaleFactorMini: 0.725,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            Observer(builder: (BuildContext contex) {
              try {
                if (controller.listColab.data[0] != null) {
                  return Container(
                    height: sizeConfig.dynamicScaleSize(
                        size: 585,
                        scaleFactorMini: 0.67,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    width: sizeConfig.dynamicScaleSize(
                        size: _width,
                        scaleFactorMini: 1,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    child: ListView.builder(
                        itemCount: controller.listColab.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: sizeConfig.dynamicScaleSize(
                                size: 50,
                                scaleFactorMini: 0.725,
                                scaleFactorTablet: 0,
                                scaleFactorNormal: 1),
                            margin: EdgeInsets.only(
                                bottom: sizeConfig.dynamicScaleSize(
                                    size: 10,
                                    scaleFactorMini: 0.725,
                                    scaleFactorTablet: 0,
                                    scaleFactorNormal: 1)),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: sizeConfig.dynamicScaleSize(
                                      size: 50,
                                      scaleFactorMini: 0.725,
                                      scaleFactorTablet: 0,
                                      scaleFactorNormal: 1),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text(
                                    controller.listColab.data[index].nome[0]
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: sizeConfig.dynamicScaleSize(
                                          size: 18,
                                          scaleFactorMini: 0.725,
                                          scaleFactorTablet: 0,
                                          scaleFactorNormal: 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: sizeConfig.dynamicScaleSize(
                                      size: 18,
                                      scaleFactorMini: 0.725,
                                      scaleFactorTablet: 0,
                                      scaleFactorNormal: 1),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.listColab.data[index].nome,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 18,
                                            scaleFactorMini: 0.725,
                                            scaleFactorTablet: 0,
                                            scaleFactorNormal: 1),
                                      ),
                                    ),
                                    Text(
                                      controller.listColab.data[index].email,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 18,
                                            scaleFactorMini: 0.725,
                                            scaleFactorTablet: 0,
                                            scaleFactorNormal: 1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: sizeConfig.dynamicScaleSize(
                                      size: 50,
                                      scaleFactorMini: 0.725,
                                      scaleFactorTablet: 0,
                                      scaleFactorNormal: 1),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Container(
                                              height:
                                                  sizeConfig.dynamicScaleSize(
                                                      size: 150,
                                                      scaleFactorMini: 0.725,
                                                      scaleFactorTablet: 0,
                                                      scaleFactorNormal: 1),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.warning,
                                                        color: Colors.red,
                                                        size: sizeConfig
                                                            .dynamicScaleSize(
                                                                size: 50,
                                                                scaleFactorMini:
                                                                    0.725,
                                                                scaleFactorTablet:
                                                                    0,
                                                                scaleFactorNormal:
                                                                    1),
                                                      ),
                                                      SizedBox(
                                                        width: sizeConfig
                                                            .dynamicScaleSize(
                                                                size: 10,
                                                                scaleFactorMini:
                                                                    0.725,
                                                                scaleFactorTablet:
                                                                    0,
                                                                scaleFactorNormal:
                                                                    1),
                                                      ),
                                                      Text(
                                                        "Cuidado!!",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Revalia',
                                                            fontSize: sizeConfig
                                                                .dynamicScaleSize(
                                                                    size: 25,
                                                                    scaleFactorMini:
                                                                        0.725,
                                                                    scaleFactorTablet:
                                                                        0,
                                                                    scaleFactorNormal:
                                                                        1),
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                        fontSize: sizeConfig
                                                            .dynamicScaleSize(
                                                                size: 16,
                                                                scaleFactorMini:
                                                                    0.725,
                                                                scaleFactorTablet:
                                                                    0,
                                                                scaleFactorNormal:
                                                                    1),
                                                        color: Colors.black,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                '\nVocẽ está excluindo o colaborador '),
                                                        TextSpan(
                                                            text:
                                                                '${controller.listColab.data[index].nome}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        TextSpan(text: '.\n\n'),
                                                        TextSpan(
                                                            text:
                                                                'Deseja proseguir?'),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text(
                                                  "Sim",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  controller.remove(controller
                                                      .listColab.data[index]);
                                                  Modular.to.pop();
                                                },
                                              ),
                                              FlatButton(
                                                child: Text(
                                                  "Não",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                onPressed: () {
                                                  Modular.to.pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    })
                              ],
                            ),
                          );
                        }),
                  );
                }
              } catch (NoSuchMethodError) {
                return CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/colab/addColab',
              arguments: [controller.key, controller.value]);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
