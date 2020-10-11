import 'package:flutter/material.dart';

import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/textCustom.dart';
import 'package:space_farming_modular/app/shared/models/botijao.dart';
import 'package:space_farming_modular/app/shared/models/hist_abastecimento.dart';
import 'package:space_farming_modular/app/shared/models/hist_nivel.dart';

class HistoricoAbastecimentoComponent extends StatefulWidget {
  List<HistoricoAbastecimento> list;

  Botijao botijao;
  HistoricoAbastecimentoComponent({
    Key key,
    this.list,
    this.botijao,
  }) : super(key: key);
  @override
  _HistoricoAbastecimentoComponentState createState() =>
      _HistoricoAbastecimentoComponentState();
}

class _HistoricoAbastecimentoComponentState
    extends State<HistoricoAbastecimentoComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
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
              height: 20,
            ),
            ContainerBase(componets: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextCustom(
                    text: "Nivel Anterior: ",
                    fontSize: 16,
                  ),
                  TextCustom(
                    text: "${widget.list[index].qtdAtual}",
                    fontSize: 16,
                  ),
                  TextCustom(
                    text: " | ",
                    fontSize: 18,
                  ),
                  TextCustom(
                    text: "Nivel Adicionado: ",
                    fontSize: 16,
                  ),
                  TextCustom(
                    text: "${widget.list[index].qtdAdd}",
                    fontSize: 16,
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
                text: "${widget.list[index].data}",
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
                text: "R\$${widget.list[index].preco}",
                fontSize: 14,
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ],
        );
      },
    );
  }
}
