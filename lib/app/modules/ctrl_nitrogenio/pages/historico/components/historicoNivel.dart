import 'package:flutter/material.dart';

import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/textCustom.dart';

class HistoricoNivel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ContainerBase(componets: [
            Center(
              child: Text(
                "Botijão 1",
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
            height: 20,
          ),
          ContainerBase(componets: [
            Center(
              child: TextCustom(
                text: "Nivel 42.0",
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
              text: "Diogo José da Silva Ribeiro",
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
              text: "10/09/2020",
              fontSize: 14,
            ),
            SizedBox(
              height: 5,
            ),
          ]),
        ],
      ),
    );
  }
}
