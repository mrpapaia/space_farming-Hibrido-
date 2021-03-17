import 'package:flutter/material.dart';

import 'package:space_farming_modular/app/shared/components/containerBase.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
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
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    var _width = MediaQuery.of(context).size.width - 30;
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: sizeConfig.dynamicScaleSize(
                  size: 20,
                  scaleFactorMini: 0.75,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            ContainerBase(
                width: sizeConfig.dynamicScaleSize(
                    size: _width,
                    scaleFactorMini: 0.75,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
                componets: [
                  Center(
                    child: Text(
                      "Botijão ${widget.botijao.idBot}",
                      style: TextStyle(
                        fontFamily: "Robot",
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 35,
                            scaleFactorMini: 0.75,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ]),
            SizedBox(
              height: sizeConfig.dynamicScaleSize(
                  size: 10,
                  scaleFactorMini: 0.75,
                  scaleFactorTablet: 0,
                  scaleFactorNormal: 1),
            ),
            ContainerBase(
                width: sizeConfig.dynamicScaleSize(
                    size: _width,
                    scaleFactorMini: 1,
                    scaleFactorTablet: 0,
                    scaleFactorNormal: 1),
                componets: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextCustom(
                        text: "Anterior: ",
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 16,
                            scaleFactorMini: 1,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                      ),
                      TextCustom(
                        text:
                            "${widget.list[index].qtdAtual.toStringAsFixed(2)}",
                        fontSize: 16,
                      ),
                      TextCustom(
                        text: " | ",
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 18,
                            scaleFactorMini: 1,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                      ),
                      TextCustom(
                          text: "Adicionado: ",
                          fontSize: sizeConfig.dynamicScaleSize(
                              size: 16,
                              scaleFactorMini: 1,
                              scaleFactorTablet: 0,
                              scaleFactorNormal: 1)),
                      TextCustom(
                        text: "${widget.list[index].qtdAdd.toStringAsFixed(2)}",
                        fontSize: sizeConfig.dynamicScaleSize(
                            size: 16,
                            scaleFactorMini: 1,
                            scaleFactorTablet: 0,
                            scaleFactorNormal: 1),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: sizeConfig.dynamicScaleSize(
                          size: 5,
                          scaleFactorMini: 0.75,
                          scaleFactorTablet: 0,
                          scaleFactorNormal: 1)),
                  Divider(
                    height: sizeConfig.dynamicScaleSize(
                        size: 10,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    thickness: 1,
                    color: Color.fromRGBO(113, 111, 138, 1.0),
                  ),
                  TextCustom(
                    text: "Nome do Responsável: ",
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 18,
                        scaleFactorMini: 1,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 5,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  TextCustom(
                    text: "${widget.list[index].respon}",
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 14,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 5,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  TextCustom(
                    text: "Data: ",
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 16,
                        scaleFactorMini: 1,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 5,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  TextCustom(
                    text:
                        "${widget.list[index].data.day}/${widget.list[index].data.month}/${widget.list[index].data.year}",
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 14,
                        scaleFactorMini: 1,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 10,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  Divider(
                    height: sizeConfig.dynamicScaleSize(
                        size: 10,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                    thickness: 1,
                    color: Color.fromRGBO(113, 111, 138, 1.0),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 5,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  TextCustom(
                    text: "Preço Litro: ",
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 18,
                        scaleFactorMini: 1,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 5,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  TextCustom(
                    text: "R\$${widget.list[index].preco}",
                    fontSize: sizeConfig.dynamicScaleSize(
                        size: 14,
                        scaleFactorMini: 1,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                  SizedBox(
                    height: sizeConfig.dynamicScaleSize(
                        size: 5,
                        scaleFactorMini: 0.75,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1),
                  ),
                ]),
          ],
        );
      },
    );
  }
}
