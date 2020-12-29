import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/home_controller.dart';

import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/components/container_caneca.dart';

import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

import 'package:space_farming_modular/app/shared/models/botijao.dart';

import 'package:space_farming_modular/app/shared/models/user.dart';

class GridViewList extends StatefulWidget {
  List<Botijao> listBotijao;
  UserP user;
  double width;
  double height;
  HomeController controller;
  GridViewList(
      {Key key,
      this.listBotijao,
      this.user,
      this.width,
      this.height,
      this.controller})
      : super(key: key);

  @override
  _GridViewListState createState() => _GridViewListState();
}

class _GridViewListState extends State<GridViewList> {
  @override
  Widget build(BuildContext context) {
    double hIcon = widget.height > 700 ? 0.035 : 0.04;
    double wIcon = widget.height > 700 ? 0.075 : 0.08;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    try {
      return GridView.builder(
        itemCount: widget.listBotijao.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          widget.listBotijao[index].canecas
              .sort((a, b) => int.parse(a.id.id).compareTo(int.parse(b.id.id)));
          return InkWell(
            child: Container(
              width: sizeConfig.dynamicScaleSize(size: 100),
              margin: EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color.fromRGBO(248, 248, 251, 1.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    offset: Offset(4, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: sizeConfig.dynamicScaleSize(size: 150),
                            height: sizeConfig.dynamicScaleSize(size: 150),
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
                        Positioned(
                          child: Container(
                            child: Center(
                              child: Text(
                                "${widget.listBotijao[index].volAtual.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontFamily: 'Robot',
                                  fontSize:
                                      sizeConfig.dynamicScaleSize(size: 15),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            width: sizeConfig.dynamicScaleSize(size: 50),
                            height: sizeConfig.dynamicScaleSize(size: 45),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(126, 116, 116, 1.0),
                                  width: 5),
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromRGBO(229, 231, 236, 1.0),
                            ),
                          ),
                          top: sizeConfig.dynamicScaleSize(size: 50),
                          left: sizeConfig.dynamicScaleSize(size: 60),
                        ),
                        widget.listBotijao[index].numcanecas >= 6
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[5].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[5].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                bottom: sizeConfig.dynamicScaleSize(size: 10),
                                left: sizeConfig.dynamicScaleSize(size: 57),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        widget.listBotijao[index].numcanecas >= 4
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[3].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[3].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                bottom: sizeConfig.dynamicScaleSize(size: 10),
                                right: sizeConfig.dynamicScaleSize(size: 57),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        widget.listBotijao[index].numcanecas >= 8
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[6].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[6].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                bottom: sizeConfig.dynamicScaleSize(size: 30),
                                right: sizeConfig.dynamicScaleSize(size: 30),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        widget.listBotijao[index].numcanecas >= 10
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[8].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[8].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                top: sizeConfig.dynamicScaleSize(size: 30),
                                right: sizeConfig.dynamicScaleSize(size: 30),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        widget.listBotijao[index].numcanecas >= 6
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[4].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[4].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                top: sizeConfig.dynamicScaleSize(size: 10),
                                right: sizeConfig.dynamicScaleSize(size: 57),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        widget.listBotijao[index].numcanecas >= 4
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[2].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[2].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                top: sizeConfig.dynamicScaleSize(size: 10),
                                left: sizeConfig.dynamicScaleSize(size: 57),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        widget.listBotijao[index].numcanecas >= 8
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[7].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[7].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                top: sizeConfig.dynamicScaleSize(size: 30),
                                left: sizeConfig.dynamicScaleSize(size: 30),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                        Positioned(
                          child: ContainerCaneca(
                            flag: true,
                            id: widget.listBotijao[index].canecas[0].id.id,
                            color: widget.listBotijao[index].canecas[0].color,
                            h: hIcon,
                            w: wIcon,
                          ),
                          top: sizeConfig.dynamicScaleSize(size: 60),
                          left: sizeConfig.dynamicScaleSize(size: 20),
                        ),
                        Positioned(
                          child: ContainerCaneca(
                            flag: true,
                            id: widget.listBotijao[index].canecas[1].id.id,
                            color: widget.listBotijao[index].canecas[1].color,
                            h: hIcon,
                            w: wIcon,
                          ),
                          top: sizeConfig.dynamicScaleSize(size: 60),
                          right: sizeConfig.dynamicScaleSize(size: 20),
                        ),
                        widget.listBotijao[index].numcanecas >= 10
                            ? Positioned(
                                child: ContainerCaneca(
                                  flag: true,
                                  id: widget
                                      .listBotijao[index].canecas[9].id.id,
                                  color: widget
                                      .listBotijao[index].canecas[9].color,
                                  h: hIcon,
                                  w: wIcon,
                                ),
                                bottom: sizeConfig.dynamicScaleSize(size: 30),
                                left: sizeConfig.dynamicScaleSize(size: 30),
                              )
                            : SizedBox(
                                width: 0,
                                height: 0,
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: widget.height * 0.006,
                  ),
                  Container(
                    //  margin: EdgeInsets.only(top: 1.0),
                    padding: EdgeInsets.all(3),
                    child: Center(
                      child: Text(
                        "${widget.listBotijao[index].idBot}",
                        style: TextStyle(
                            fontFamily: 'Revalia',
                            fontSize: sizeConfig.dynamicScaleSize(size: 13),
                            color: Colors.white),
                      ),
                    ),
                    height: sizeConfig.dynamicScaleSize(size: 21),
                    width: sizeConfig.dynamicScaleSize(size: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Modular.to.pushNamed('/home/info',
                  arguments: [widget.user, widget.listBotijao[index]]);
            },
            onLongPress: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  int qtdEnabled = 0;
                  widget.listBotijao[index].canecas.forEach((caneca) {
                    if (caneca.estado == "enabled") {
                      qtdEnabled++;
                    }
                  });
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    elevation: 0.0,
                    //title: Center(child: Text("Botijao")),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: sizeConfig.dynamicScaleSize(size: 400),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(229, 231, 236, 1.0),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Botijão ${widget.listBotijao[index].idBot}",
                                style: TextStyle(
                                    fontFamily: 'Revalia',
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        sizeConfig.dynamicScaleSize(size: 20),
                                    color: Colors.black),
                              ),
                              Divider(),
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 70),
                                    ),
                                    Icon(Icons.info, color: Colors.grey[700]),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 25),
                                    ),
                                    Text(
                                      "Informações",
                                      style: TextStyle(
                                          fontFamily: 'Revalia',
                                          fontSize: sizeConfig.dynamicScaleSize(
                                              size: 13),
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                                /*   onTap: () {
                                  Modular.to.pop();
                                  Modular.to.pushNamed('/home/info',
                                      arguments: [
                                        widget.user,
                                        widget.listBotijao[index]
                                      ]);
                                },*/
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        sizeConfig.dynamicScaleSize(size: 15),
                                  ),
                                  Text(
                                    "Nivel Atual:",
                                    style: TextStyle(
                                        fontFamily: 'Revalia',
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 13),
                                        color: Colors.grey[700]),
                                  ),
                                  SizedBox(
                                    width:
                                        sizeConfig.dynamicScaleSize(size: 10),
                                  ),
                                  Text(
                                    "${widget.listBotijao[index].volAtual}",
                                    style: TextStyle(
                                        fontFamily: 'Revalia',
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 13),
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        sizeConfig.dynamicScaleSize(size: 15),
                                  ),
                                  Text(
                                    "Quantidade de canecas:",
                                    style: TextStyle(
                                        fontFamily: 'Revalia',
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 13),
                                        color: Colors.grey[700]),
                                  ),
                                  SizedBox(
                                    width:
                                        sizeConfig.dynamicScaleSize(size: 10),
                                  ),
                                  Text(
                                    "${widget.listBotijao[index].numcanecas}",
                                    style: TextStyle(
                                        fontFamily: 'Revalia',
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 13),
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        sizeConfig.dynamicScaleSize(size: 15),
                                  ),
                                  Text(
                                    "Quantidade de canecas atual:",
                                    style: TextStyle(
                                        fontFamily: 'Revalia',
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 13),
                                        color: Colors.grey[700]),
                                  ),
                                  SizedBox(
                                    width:
                                        sizeConfig.dynamicScaleSize(size: 10),
                                  ),
                                  Text(
                                    "${qtdEnabled}",
                                    style: TextStyle(
                                        fontFamily: 'Revalia',
                                        fontSize: sizeConfig.dynamicScaleSize(
                                            size: 13),
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                              Divider(),
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 70),
                                    ),
                                    Icon(MyIcons.volume, color: Colors.blue),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 25),
                                    ),
                                    Text(
                                      "Medir Nível",
                                      style: TextStyle(
                                          fontFamily: 'Revalia',
                                          fontSize: sizeConfig.dynamicScaleSize(
                                              size: 13),
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Modular.to.pop();
                                  Modular.to.pushNamed('/ctrl/medirNivel',
                                      arguments: [
                                        widget.listBotijao[index],
                                        widget.user
                                      ]);
                                },
                              ),
                              Divider(),
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 70),
                                    ),
                                    Icon(MyIcons.volume, color: Colors.blue),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 25),
                                    ),
                                    Text(
                                      "Abastecer",
                                      style: TextStyle(
                                          fontFamily: 'Revalia',
                                          fontSize: sizeConfig.dynamicScaleSize(
                                              size: 13),
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Modular.to.pop();
                                  Modular.to.pushNamed('/ctrl/abastecer',
                                      arguments: [
                                        widget.listBotijao[index],
                                        widget.user
                                      ]);
                                },
                              ),
                              Divider(),
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 70),
                                    ),
                                    Icon(MyIcons.history, color: Colors.blue),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 25),
                                    ),
                                    Text(
                                      "Histórico",
                                      style: TextStyle(
                                          fontFamily: 'Revalia',
                                          fontSize: sizeConfig.dynamicScaleSize(
                                              size: 13),
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Modular.to.pop();
                                },
                              ),
                              Divider(),
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 70),
                                    ),
                                    Icon(Icons.edit, color: Colors.green),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 25),
                                    ),
                                    Text(
                                      "Editar",
                                      style: TextStyle(
                                          fontFamily: 'Revalia',
                                          fontSize: sizeConfig.dynamicScaleSize(
                                              size: 13),
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  //print(widget.listBotijao[index]);
                                  Modular.to.pop();
                                  Modular.to.pushNamed('/home/add', arguments: [
                                    // widget.controller.listBot
                                    widget.listBotijao[index].ref.path,
                                    widget.listBotijao[index]
                                  ]);
                                },
                              ),
                              Divider(),
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 70),
                                    ),
                                    Icon(Icons.delete_forever,
                                        color: Colors.red),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 25),
                                    ),
                                    Text(
                                      "Excluir",
                                      style: TextStyle(
                                          fontFamily: 'Revalia',
                                          fontSize: sizeConfig.dynamicScaleSize(
                                              size: 13),
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Modular.to.pop();
                                  widget.controller.remove(
                                      widget.listBotijao[index].ref.path);
                                  widget.listBotijao.remove(index);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(229, 231, 236, 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Center(
                                child: Text(
                              "Cancelar",
                              style: TextStyle(
                                  fontFamily: 'Revalia',
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      sizeConfig.dynamicScaleSize(size: 13),
                                  color: Colors.black),
                            )),
                          ),
                          onTap: () {
                            Modular.to.pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      );
    } on RangeError catch (e) {
      return Column(
        children: [
          Center(
            child: Text("Aguerde..."),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
    } on NoSuchMethodError catch (e) {
      return Column(
        children: [
          Center(
            child: Text("Aguerde2.."),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
    }
  }
}
