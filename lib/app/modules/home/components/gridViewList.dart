import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/src/api/async.dart';
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
    String imgSrc = '';
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        widget.listBotijao.length,
        (index) {
          switch (widget.listBotijao[index].numcanecas) {
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
          return Dismissible(
            background: lideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            key: Key(widget.listBotijao[index].idBot),
            child: InkWell(
              child: Container(
                width: _width * 0.5,
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
                    Image(
                      image: AssetImage(imgSrc),
                      width: _width * 0.4,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.all(2.0),
                      child: Center(
                        child: Text(
                          "Botijao ${widget.listBotijao[index].idBot}",
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
  }
}
