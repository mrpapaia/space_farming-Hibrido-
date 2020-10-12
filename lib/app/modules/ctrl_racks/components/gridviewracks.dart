import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/src/api/async.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';
import 'package:space_farming_modular/app/shared/models/rack.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';

class GridViewRacks extends StatefulWidget {
  List<Rack> listRack;
  User user;
  GridViewRacks({Key key, this.listRack, this.user}) : super(key: key);

  @override
  _GridViewRacksState createState() => _GridViewRacksState();
}

class _GridViewRacksState extends State<GridViewRacks> {
  @override
  Widget build(BuildContext context) {
    String imgSrc = '';

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
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(2.0),
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
            onTap: () {
              /* Modular.to.pushNamed('/home/info', arguments: [
                widget.listBotijao[index],widget.user
              ]);*/
            },
          );
        },
      ),
    );
  }
}
