import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/hexcolor.dart';

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
  Color currentColor = Colors.limeAccent;

  String toHex(Color color) => "#" + color.value.toRadixString(16).substring(2);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    double hBot = _height > 700 ? 0.07 : 0.08;
    double wBot = _height > 700 ? 0.155 : 0.15;

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
            height: _height > 700 ? _height * 0.05 : _height * 0.03,
          ),
          Observer(builder: (_) {
            return Container(
              child: Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: _height > 700 ? _width * 0.95 : _width * 0.95,
                        height: _height > 700 ? _height * 0.5 : _height * 0.5,
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
                              "${widget.botijao.volAtual.roundToDouble()}",
                              style: TextStyle(
                                fontFamily: 'Robot',
                                fontSize: _width * 0.1,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          width: _height > 700 ? 100 : 100,
                          height: _height > 700 ? 100 : 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(126, 116, 116, 1.0),
                              width: 5,
                            ),
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
                        onTap: () {
                          Modular.to.pushNamed('/ctrl',
                              arguments: [widget.botijao, widget.user]);
                        },
                      ),
                    ),
                    widget.botijao.numcanecas >= 8
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num8,
                                color: widget.botijao.canecas[6].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[6],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[6].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[6].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top:
                                _height > 700 ? _height * 0.24 : _height * 0.26,
                            left: _height > 700 ? _width * 0.1 : _width * 0.1,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    widget.botijao.numcanecas >= 10
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num2,
                                color: widget.botijao.canecas[8].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[8],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[8].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[8].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top: _height > 700
                                ? _height * 0.223
                                : _height * 0.26,
                            left: _height > 700 ? _width * 0.63 : _width * 0.65,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    widget.botijao.numcanecas >= 6
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num3,
                                color: widget.botijao.canecas[4].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[4],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[4].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[4].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top:
                                _height > 700 ? _height * 0.03 : _height * 0.03,
                            left: _height > 700 ? _width * 0.28 : _width * 0.28,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    widget.botijao.numcanecas >= 10
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num4,
                                color: widget.botijao.canecas[9].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[9],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[9].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[9].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top: _height > 700
                                ? _height * 0.068
                                : _height * 0.068,
                            left:
                                _height > 700 ? _width * 0.115 : _width * 0.115,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    Positioned(
                      child: InkWell(
                        child: ContainerCaneca(
                          icon: CanecaIcons.num5,
                          color: widget.botijao.canecas[0].color,
                          h: hBot,
                          w: wBot,
                        ),
                        onTap: () {
                          Modular.to.pushNamed('/rack', arguments: [
                            widget.botijao.canecas[0],
                            widget.user
                          ]);
                        },
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              Color cor;
                              return AlertDialog(
                                title: Text('Selecione a cor da caneca'),
                                content: SingleChildScrollView(
                                  child: BlockPicker(
                                    pickerColor:
                                        widget.botijao.canecas[0].color,
                                    onColorChanged: (Color color) =>
                                        cor = color,
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      "Contirmar",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      toHex(cor);
                                      setState(() {
                                        widget.botijao.canecas[0].color = cor;
                                      });

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "Cancelar",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      top: _height > 700 ? _height * 0.155 : _height * 0.16,
                      left: _height > 700 ? _width * 0.05 : _width * 0.05,
                    ),
                    widget.botijao.numcanecas >= 4
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num6,
                                color: widget.botijao.canecas[2].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[2],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[2].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[2].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top:
                                _height > 700 ? _height * 0.03 : _height * 0.03,
                            left: _height > 700 ? _width * 0.48 : _width * 0.48,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    widget.botijao.numcanecas >= 8
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num7,
                                color: widget.botijao.canecas[7].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[7],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[7].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[7].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top:
                                _height > 700 ? _height * 0.07 : _height * 0.07,
                            left: _height > 700 ? _width * 0.65 : _width * 0.65,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    widget.botijao.numcanecas >= 2
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num8,
                                color: widget.botijao.canecas[1].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[1],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[1].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[1].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top:
                                _height > 700 ? _height * 0.15 : _height * 0.16,
                            left: _height > 700 ? _width * 0.7 : _width * 0.7,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    widget.botijao.numcanecas >= 6
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num1,
                                color: widget.botijao.canecas[5].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[5],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[5].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[5].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top:
                                _height > 700 ? _height * 0.28 : _height * 0.31,
                            left: _height > 700 ? _width * 0.48 : _width * 0.48,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                    widget.botijao.numcanecas >= 4
                        ? Positioned(
                            child: InkWell(
                              child: ContainerCaneca(
                                icon: CanecaIcons.num8,
                                color: widget.botijao.canecas[3].color,
                                h: hBot,
                                w: wBot,
                              ),
                              onTap: () {
                                Modular.to.pushNamed('/rack', arguments: [
                                  widget.botijao.canecas[3],
                                  widget.user
                                ]);
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    Color cor;
                                    return AlertDialog(
                                      title: Text('Selecione a cor da caneca'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor:
                                              widget.botijao.canecas[3].color,
                                          onColorChanged: (Color color) =>
                                              cor = color,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "Contirmar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            toHex(cor);
                                            setState(() {
                                              widget.botijao.canecas[3].color =
                                                  cor;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text(
                                            "Cancelar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            top:
                                _height > 700 ? _height * 0.28 : _height * 0.31,
                            left: _height > 700 ? _width * 0.28 : _width * 0.28,
                          )
                        : SizedBox(
                            width: 0,
                            height: 0,
                          ),
                  ],
                ),
              ),
              width: _width * 0.95,
              height: _height > 700 ? _height * 0.4 : _height * 0.45,
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
            );
          }),
          SizedBox(
            height: _height > 700 ? _height * 0.05 : _height * 0.03,
          ),
          TitleOfScreen(
            title: "Régua",
            font: "Revalia",
            fontSize: _width * 0.09,
          ),
          Container(
            child: Stack(
              children: [
                Image(
                  image: AssetImage("lib/app/shared/graphics/regua.png"),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    thumbColor: Colors.black,
                    overlayColor: Colors.red.withAlpha(0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 3.0),
                  ),
                  child: Slider(
                    value: widget.botijao.volAtual,
                    min: 0,
                    max: 51,
                    onChanged: (value) {
                      setState(
                        () {
                          widget.botijao.volAtual = value;
                        },
                      );
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
        ],
      ),
    );
  }
}
