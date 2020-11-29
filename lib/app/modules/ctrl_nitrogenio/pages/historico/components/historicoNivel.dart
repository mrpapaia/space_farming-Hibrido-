import 'package:flutter/material.dart';

import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/textCustom.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';

class HistoricoNivelComponent extends StatefulWidget {
  List<HistoricoNivel> list;
  Botijao botijao;
  HistoricoNivelComponent({Key key, this.list, this.botijao}) : super(key: key);
  @override
  _HistoricoNivelState createState() => _HistoricoNivelState();
}

class _HistoricoNivelState extends State<HistoricoNivelComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ContainerBase(componets: [
              Center(
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
            ]),
            SizedBox(
              height: 10,
            ),
            ContainerBase(componets: [
              Center(
                child: TextCustom(
                  text: "Nivel ${widget.list[index].qtdAtual}",
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextCustom(
                text: "Nome do Responsavel: ",
                fontSize: 18,
              ),
              SizedBox(
                height: 5,
              ),
              TextCustom(
                text: "${widget.list[index].respon}",
                fontSize: 14,
              ),
              SizedBox(
                height: 5,
              ),
              TextCustom(
                text: "Telefone: ",
                fontSize: 18,
              ),
              SizedBox(
                height: 5,
              ),
              TextCustom(
                text: "649292639452",
                fontSize: 14,
              ),
              SizedBox(
                height: 5,
              ),
              TextCustom(
                text: "E-mail: ",
                fontSize: 18,
              ),
              SizedBox(
                height: 5,
              ),
              TextCustom(
                text: "djoser@gmail.com",
                fontSize: 14,
              ),
              SizedBox(
                height: 5,
              ),
              TextCustom(
                text: "Data: ",
                fontSize: 18,
              ),
              SizedBox(
                height: 5,
              ),
              TextCustom(
                text:
                    "${widget.list[index].data.day}/${widget.list[index].data.month}/${widget.list[index].data.year}",
                fontSize: 14,
              ),
              SizedBox(
                height: 5,
              ),
            ]),
          ],
        );
      },
    );
  }
}
