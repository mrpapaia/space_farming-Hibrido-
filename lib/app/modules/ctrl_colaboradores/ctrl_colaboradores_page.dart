import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'ctrl_colaboradores_controller.dart';

class CtrlColaboradoresPage extends StatefulWidget {
  final String title;
  const CtrlColaboradoresPage({Key key, this.title = "CtrlColaboradores"})
      : super(key: key);

  @override
  _CtrlColaboradoresPageState createState() => _CtrlColaboradoresPageState();
}

class _CtrlColaboradoresPageState
    extends ModularState<CtrlColaboradoresPage, CtrlColaboradoresController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      body: Column(
        children: [
          SizedBox(
            height: sizeConfig.dynamicScaleSize(size: 15),
          ),
          TitleOfScreen(
            title: "Colaboradores",
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(size: 30),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(size: 25),
          ),
          Observer(builder: (BuildContext contex) {
            try {
              if (controller.listColab.data[0] != null) {
                return Container(
                  height: sizeConfig.dynamicScaleSize(size: 585),
                  width: MediaQuery.of(context).size.width - 30,
                  child: ListView.builder(
                      itemCount: controller.listColab.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: sizeConfig.dynamicScaleSize(size: 50),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: sizeConfig.dynamicScaleSize(size: 50),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text(
                                  controller.listColab.data[index].nome[0]
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize:
                                        sizeConfig.dynamicScaleSize(size: 18),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: sizeConfig.dynamicScaleSize(size: 18),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.listColab.data[index].nome,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          sizeConfig.dynamicScaleSize(size: 18),
                                    ),
                                  ),
                                  Text(
                                    controller.listColab.data[index].email,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          sizeConfig.dynamicScaleSize(size: 18),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: sizeConfig.dynamicScaleSize(size: 50),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              "Logado com sucesso!!\nBem Vindo ${controller.listColab.data[index].nome}"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                "Remover",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              onPressed: () {
                                                controller.remove(controller
                                                    .listColab.data[index]);
                                                Modular.to.pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              onPressed: () {
                                                Modular.to.pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  })
                            ],
                          ),
                        );
                      }),
                );
              }
            } catch (NoSuchMethodError) {
              return CircularProgressIndicator();
            }
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/colab/addColab',
              arguments: [controller.key, controller.value]);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
