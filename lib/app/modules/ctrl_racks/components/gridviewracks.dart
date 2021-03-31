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
                            fontSize: sizeConfig.dynamicScaleSize(
                                size: 14,
                                scaleFactorMini: 0.725,
                                scaleFactorTablet: 0,
                                scaleFactorNormal: 1),
                            color: Colors.white),
                      ),
                    ),
                    width: sizeConfig.dynamicScaleSize(
                        size: 150,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 20,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.listRack[index].doseUp}",
                        style: TextStyle(
                            fontSize: sizeConfig.dynamicScaleSize(
                                size: 20,
                                scaleFactorMini: 0.725,
                                scaleFactorTablet: 0,
                                scaleFactorNormal: 0.8),
                            fontFamily: 'Revalia'),
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
                          style: TextStyle(
                              fontSize: sizeConfig.dynamicScaleSize(
                                  size: 20,
                                  scaleFactorMini: 0.725,
                                  scaleFactorTablet: 0,
                                  scaleFactorNormal: 0.8),
                              fontFamily: 'Revalia')),
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
                    padding: EdgeInsets.all(3),
                    child: Center(
                      child: Text(
                        "${widget.listRack[index].tipo}",
                        style: TextStyle(
                            fontFamily: 'Revalia',
                            fontSize: sizeConfig.dynamicScaleSize(
                                size: 14,
                                scaleFactorMini: 0.725,
                                scaleFactorTablet: 0,
                                scaleFactorNormal: 1),
                            color: Colors.white),
                      ),
                    ),
                    width: sizeConfig.dynamicScaleSize(
                        size: 200,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8),
                    height: sizeConfig.dynamicScaleSize(
                        size: 30,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 0.8),
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
                      content: Container(
                        height: sizeConfig.dynamicScaleSize(
                            size: 560,
                            scaleFactorMini: 0.725,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 0.8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: sizeConfig.dynamicScaleSize(
                                  size: 400,
                                  scaleFactorMini: 0.725,
                                  scaleFactorTablet: 0,
                                  scaleFactorNormal: 0.8),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.info, color: Colors.grey[700]),
                                      SizedBox(
                                        width: sizeConfig.dynamicScaleSize(
                                            size: 25,
                                            scaleFactorMini: 0.725,
                                            scaleFactorTablet: 0,
                                            scaleFactorNormal: 0.8),
                                      ),
                                      Text(
                                        "Informações da dose",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Revalia',
                                            fontSize:
                                                sizeConfig.dynamicScaleSize(
                                                    size: 18,
                                                    scaleFactorMini: 0.725,
                                                    scaleFactorTablet: 0,
                                                    scaleFactorNormal: 0.8),
                                            color: Colors.grey[700]),
                                      ),
                                    ],
                                  ),
                                  Divider(color: Colors.white),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Touro",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "${widget.listRack[index].idTouro}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Text("No rack",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Tipo",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text("${widget.listRack[index].tipo}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Cima ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "${widget.listRack[index].doseUp}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Baixo ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "${widget.listRack[index].doseDown}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Text("Na Caneca",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Total ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text("${total}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Embrião ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text("${totalEmbriao}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Convencional",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text("${totalConvencianado}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Sexado ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text("${totalSexado}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.edit, color: Colors.green),
                                        SizedBox(
                                          width: sizeConfig.dynamicScaleSize(
                                              size: 25,
                                              scaleFactorMini: 0.725,
                                              scaleFactorTablet: 0,
                                              scaleFactorNormal: 0.8),
                                        ),
                                        Text(
                                          "Editar",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Revalia',
                                              fontSize:
                                                  sizeConfig.dynamicScaleSize(
                                                      size: 18,
                                                      scaleFactorMini: 0.725,
                                                      scaleFactorTablet: 0,
                                                      scaleFactorNormal: 0.8),
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Modular.to.pushNamed('/rack/addRack',
                                          arguments: [widget.listRack[index]]);
                                      //Modular.to.pop();
                                    },
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.delete_forever,
                                            color: Colors.red),
                                        SizedBox(
                                          width: sizeConfig.dynamicScaleSize(
                                              size: 25,
                                              scaleFactorMini: 0.725,
                                              scaleFactorTablet: 0,
                                              scaleFactorNormal: 0.8),
                                        ),
                                        Text(
                                          "Excluir",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Revalia',
                                              fontSize:
                                                  sizeConfig.dynamicScaleSize(
                                                      size: 18,
                                                      scaleFactorMini: 0.725,
                                                      scaleFactorTablet: 0,
                                                      scaleFactorNormal: 0.8),
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Modular.to.pop();

                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Color.fromRGBO(
                                                  229, 231, 236, 1.0),
                                              content: Container(
                                                height:
                                                    sizeConfig.dynamicScaleSize(
                                                        size: 150,
                                                        scaleFactorMini: 0.725,
                                                        scaleFactorTablet: 0,
                                                        scaleFactorNormal: 0.8),
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
                                                                      0.8),
                                                        ),
                                                        SizedBox(
                                                          width: sizeConfig.dynamicScaleSize(
                                                              size: 10,
                                                              scaleFactorMini:
                                                                  0.725,
                                                              scaleFactorTablet:
                                                                  0,
                                                              scaleFactorNormal:
                                                                  0.8),
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
                                                                          0.8),
                                                              color:
                                                                  Colors.red),
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
                                                                      0.8),
                                                          color: Colors.black,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  '\nVocẽ está excluindo o rack '),
                                                          TextSpan(
                                                              text:
                                                                  '${widget.listRack[index].idTouro}',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          TextSpan(
                                                              text: '.\n\n'),
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
                                                    widget.listRack
                                                        .remove(index);
                                                    widget.controller.remove(
                                                        widget.listRack[index]);
                                                    Modular.to.pop();
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text(
                                                    "Não",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    Modular.to.pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          });
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                    child: Text(
                                  "Cancelar",
                                  style: TextStyle(
                                      fontFamily: 'Revalia',
                                      fontWeight: FontWeight.bold,
                                      fontSize: sizeConfig.dynamicScaleSize(
                                          size: 18,
                                          scaleFactorMini: 0.725,
                                          scaleFactorTablet: 0,
                                          scaleFactorNormal: 0.8),
                                      color: Colors.black),
                                )),
                              ),
                              onTap: () {
                                Modular.to.pop();
                              },
                            ),
                          ],
                        ),
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
