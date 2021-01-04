import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/ctrl_racks/ctrl_racks_controller.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/slideLeftBackground.dart';
import 'package:space_farming_modular/app/shared/components/slideRightBackground.dart';

import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

class GridViewRacks extends StatefulWidget {
  List<Rack> listRack;
  UserP user;
  CtrlRacksController controller;
  GridViewRacks({Key key, this.listRack, this.user, this.controller})
      : super(key: key);

  @override
  _GridViewRacksState createState() => _GridViewRacksState();
}

class _GridViewRacksState extends State<GridViewRacks> {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        widget.listRack.length,
        (index) {
          return InkWell(
            child: Container(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        "${widget.listRack[index].idTouro}",
                        style: TextStyle(
                            fontFamily: 'Revalia',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.listRack[index].doseUp}",
                        style: TextStyle(fontSize: 20, fontFamily: 'Revalia'),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.listRack[index].doseDown}",
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'Revalia')),
                      Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    padding: EdgeInsets.all(2.5),
                    child: Center(
                      child: Text(
                        "${widget.listRack[index].tipo}",
                        style: TextStyle(
                            fontFamily: 'Revalia',
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                    width: 150,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            onLongPress: () async {
              int total = 0;
              int totalSexado = 0;
              int totalEmbriao = 0;
              int totalConvencianado = 0;

              widget.listRack.forEach((rack) {
                if (rack.idTouro == widget.listRack[index].idTouro) {
                  total += int.parse(rack.doseDown) + int.parse(rack.doseUp);
                  if (rack.tipo == "Convencional") {
                    totalConvencianado +=
                        int.parse(rack.doseDown) + int.parse(rack.doseUp);
                  } else if (rack.tipo == "Embrião") {
                    totalEmbriao +=
                        int.parse(rack.doseDown) + int.parse(rack.doseUp);
                  } else {
                    totalSexado +=
                        int.parse(rack.doseDown) + int.parse(rack.doseUp);
                  }
                }
              });

              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.info, color: Colors.grey[700]),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 25),
                                    ),
                                    Text(
                                      "Informações do Rack",
                                      style: TextStyle(
                                          fontFamily: 'Revalia',
                                          fontSize: sizeConfig.dynamicScaleSize(
                                              size: 13),
                                          color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 50),
                                    ),
                                    Text("Touro"),
                                    SizedBox(
                                      width: sizeConfig.dynamicScaleSize(
                                          size: 135),
                                    ),
                                    Text("${widget.listRack[index].idTouro}"),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 50),
                                    ),
                                    Text("Total"),
                                    SizedBox(
                                      width: sizeConfig.dynamicScaleSize(
                                          size: 150),
                                    ),
                                    Text("${total}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 50),
                                    ),
                                    Text("Convencional"),
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 90),
                                    ),
                                    Text("${totalConvencianado}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 50),
                                    ),
                                    Text("Sexado"),
                                    SizedBox(
                                      width: sizeConfig.dynamicScaleSize(
                                          size: 135),
                                    ),
                                    Text("${totalSexado}"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width:
                                          sizeConfig.dynamicScaleSize(size: 50),
                                    ),
                                    Text("Embrião"),
                                    SizedBox(
                                      width: sizeConfig.dynamicScaleSize(
                                          size: 135),
                                    ),
                                    Text("${totalEmbriao}"),
                                  ],
                                ),
                                Divider(),
                                InkWell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: sizeConfig.dynamicScaleSize(
                                            size: 70),
                                      ),
                                      Icon(Icons.edit, color: Colors.green),
                                      SizedBox(
                                        width: sizeConfig.dynamicScaleSize(
                                            size: 25),
                                      ),
                                      Text(
                                        "Editar",
                                        style: TextStyle(
                                            fontFamily: 'Revalia',
                                            fontSize: sizeConfig
                                                .dynamicScaleSize(size: 13),
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Modular.to.pushNamed('/rack/add',
                                        arguments: [widget.listRack[index]]);
                                    //Modular.to.pop();
                                  },
                                ),
                                Divider(),
                                InkWell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: sizeConfig.dynamicScaleSize(
                                            size: 70),
                                      ),
                                      Icon(Icons.delete_forever,
                                          color: Colors.red),
                                      SizedBox(
                                        width: sizeConfig.dynamicScaleSize(
                                            size: 25),
                                      ),
                                      Text(
                                        "Excluir",
                                        style: TextStyle(
                                            fontFamily: 'Revalia',
                                            fontSize: sizeConfig
                                                .dynamicScaleSize(size: 13),
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Modular.to.pop();
                                    widget.listRack.remove(index);
                                    widget.controller
                                        .remove(widget.listRack[index]);
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
                  });
            },
          );
        },
      ),
    );
  }
}
