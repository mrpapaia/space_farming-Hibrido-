import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/home_info_bot_controller.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';

class LongPressCaneca extends StatefulWidget {
  HomeInfoBotController controller;
  double h;
  double w;
  int index;
  LongPressCaneca({this.h, this.w, this.index, this.controller});
  @override
  _LongPressCanecaState createState() => _LongPressCanecaState();
}

class _LongPressCanecaState extends State<LongPressCaneca> {
  @override
  Widget build(BuildContext context) {
    List<String> items = ["Habilitado", "Desabilitado"];
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return AlertDialog(
      title: Text('caneca'),
      content: Container(
        height: sizeConfig.dynamicScaleSize(size: 100),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: sizeConfig.dynamicScaleSize(size: 15),
                ),
                Text(
                  "Estado:",
                  style: TextStyle(
                      fontFamily: 'Revalia',
                      fontSize: sizeConfig.dynamicScaleSize(size: 13),
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  width: sizeConfig.dynamicScaleSize(size: 10),
                ),
                DropdownButton<String>(
                  value:
                      widget.controller.botijao.canecas[widget.index].estado ==
                              "enebled"
                          ? items[0]
                          : items[1],
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    width: 10,
                    color: Colors.red,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      newValue == "Habilitado"
                          ? widget.controller.botijao.canecas[widget.index]
                              .estado = "enebled"
                          : widget.controller.botijao.canecas[widget.index]
                              .estado = "disabled";
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: sizeConfig.dynamicScaleSize(size: 15),
                ),
                Text(
                  "Cor",
                  style: TextStyle(
                      fontFamily: 'Revalia',
                      fontSize: sizeConfig.dynamicScaleSize(size: 13),
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  width: sizeConfig.dynamicScaleSize(size: 10),
                ),
                RaisedButton(
                  color: widget.controller.botijao.canecas[widget.index].color,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Color cor;
                        return AlertDialog(
                          title: Text('Selecione a cor da caneca'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: widget.controller.botijao
                                  .canecas[widget.index].color,
                              onColorChanged: (Color color) => cor = color,
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "Contirmar",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.controller.botijao
                                      .canecas[widget.index].color = cor;
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            "Contirmar",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            setState(() {
              // widget.controller.botijao.canecas[widget.index].color = cor;
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
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
    );
  }
}
