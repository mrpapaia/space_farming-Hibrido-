import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/src/api/async.dart';
import 'package:space_farming_modular/app/modules/home/components/hexcolor.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/components/container_caneca.dart';
import 'package:space_farming_modular/app/shared/components/caneca_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/slideLeftBackground.dart';
import 'package:space_farming_modular/app/shared/components/slideRightBackground.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

class GridViewList extends StatefulWidget {
  List<Botijao> listBotijao;
  UserP user;
  GridViewList({Key key, this.listBotijao, this.user}) : super(key: key);

  @override
  _GridViewListState createState() => _GridViewListState();
}

class _GridViewListState extends State<GridViewList> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    double hIcon = _height > 700 ? 0.035 : 0.04;
    double wIcon = _height > 700 ? 0.075 : 0.08;
    try {
      return GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          widget.listBotijao.length,
          (index) {
            //print(widget.listBotijao[index].canecas[0].color);
            return Dismissible(
              background: lideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              key: Key(widget.listBotijao[index].idBot),
              child: InkWell(
                child: Container(
                  width: _width * 0.5,
                  margin:
                      EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
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
                                width: _width * 0.4,
                                height: _height > 700
                                    ? _height * 0.18
                                    : _height * 0.25,
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
                                    "${widget.listBotijao[index].volAtual}",
                                    style: TextStyle(
                                      fontFamily: 'Robot',
                                      fontSize: _width * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                width: 50,
                                height: 45,
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
                              top: _height > 700
                                  ? _height * 0.06
                                  : _height * 0.065,
                              left: _width * 0.15,
                            ),
                            widget.listBotijao[index].numcanecas >= 6
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num2,
                                      color: widget
                                          .listBotijao[index].canecas[5].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.13
                                        : _height * 0.145,
                                    left: _height > 700
                                        ? _width * 0.14
                                        : _width * 0.14,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            widget.listBotijao[index].numcanecas >= 4
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num2,
                                      color: widget
                                          .listBotijao[index].canecas[3].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.13
                                        : _height * 0.145,
                                    left: _height > 700
                                        ? _width * 0.22
                                        : _width * 0.22,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            widget.listBotijao[index].numcanecas >= 8
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num3,
                                      color: widget
                                          .listBotijao[index].canecas[6].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.105
                                        : _height * 0.12,
                                    left: _height > 700
                                        ? _width * 0.29
                                        : _width * 0.29,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            widget.listBotijao[index].numcanecas >= 10
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num4,
                                      color: widget
                                          .listBotijao[index].canecas[8].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.033
                                        : _height * 0.033,
                                    left: _height > 700
                                        ? _width * 0.295
                                        : _width * 0.286,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            widget.listBotijao[index].numcanecas >= 6
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num5,
                                      color: widget
                                          .listBotijao[index].canecas[4].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.011
                                        : _height * 0.011,
                                    left: _height > 700
                                        ? _width * 0.23
                                        : _width * 0.215,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            widget.listBotijao[index].numcanecas >= 4
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num6,
                                      color: widget
                                          .listBotijao[index].canecas[2].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.011
                                        : _height * 0.011,
                                    left: _height > 700
                                        ? _width * 0.15
                                        : _width * 0.132,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            widget.listBotijao[index].numcanecas >= 8
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num1,
                                      color: widget
                                          .listBotijao[index].canecas[7].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.028
                                        : _height * 0.035,
                                    left: _height > 700
                                        ? _width * 0.07
                                        : _width * 0.06,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                            Positioned(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num1,
                                color:
                                    widget.listBotijao[index].canecas[0].color,
                                h: hIcon,
                                w: wIcon,
                              ),
                              top: _height > 700
                                  ? _height * 0.065
                                  : _height * 0.076,
                              left:
                                  _height > 700 ? _width * 0.04 : _width * 0.31,
                            ),
                            Positioned(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num5,
                                color:
                                    widget.listBotijao[index].canecas[1].color,
                                h: hIcon,
                                w: wIcon,
                              ),
                              top: _height > 700
                                  ? _height * 0.068
                                  : _height * 0.08,
                              left: _height > 700
                                  ? _width * 0.32
                                  : _width * 0.035,
                            ),
                            widget.listBotijao[index].numcanecas >= 10
                                ? Positioned(
                                    child: ContainerCaneca(
                                      icon: CanecaIcons.num8,
                                      color: widget
                                          .listBotijao[index].canecas[9].color,
                                      h: hIcon,
                                      w: wIcon,
                                    ),
                                    top: _height > 700
                                        ? _height * 0.105
                                        : _height * 0.125,
                                    left: _height > 700
                                        ? _width * 0.065
                                        : _width * 0.06,
                                  )
                                : SizedBox(
                                    width: 0,
                                    height: 0,
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        padding: EdgeInsets.all(6.5),
                        child: Center(
                          child: Text(
                            "${widget.listBotijao[index].idBot}",
                            style: TextStyle(
                                fontFamily: 'Revalia',
                                fontSize: _width * 0.04,
                                color: Colors.white),
                          ),
                        ),
                        width: _width * 0.35,
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
                      arguments: [widget.listBotijao[index], widget.user]);
                },
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  final bool res = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                              "Are you sure you want to delete ${widget.listBotijao[index].idBot}?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.listBotijao.removeAt(index);
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                  return res;
                } else {
                  // TODO: Navigate to edit page;
                }
              },
            );
          },
        ),
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
            child: Text("Aguerde..."),
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      );
    }
  }
}
