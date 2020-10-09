import 'package:flutter/material.dart';

import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/textCustom.dart';

class HistoricoAbastecimento extends StatelessWidget {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(
                  text: "Nivel Anterior: ",
                  fontSize: 18,
                ),
                TextCustom(
                  text: "42",
                  fontSize: 18,
                ),
                TextCustom(
                  text: " | ",
                  fontSize: 18,
                ),
                TextCustom(
                  text: "Nivel Atual: ",
                  fontSize: 18,
                ),
                TextCustom(
                  text: "42",
                  fontSize: 18,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Color.fromRGBO(113, 111, 138, 1.0),
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
              height: 10,
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Color.fromRGBO(113, 111, 138, 1.0),
            ),
            TextCustom(
              text: "Nome do Fornecedor: ",
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
              text: "Preço Litro: ",
              fontSize: 18,
            ),
            SizedBox(
              height: 5,
            ),
            TextCustom(
              text: "R\$52.52",
              fontSize: 14,
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ],
      ),
    );
  }
}
