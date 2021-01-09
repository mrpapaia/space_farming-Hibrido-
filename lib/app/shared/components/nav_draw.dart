import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/home_controller.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'my_icons_icons.dart';

class NavigationDrawer extends StatelessWidget {
  // final UserP user;
  HomeController controller;
  String path;
  NavigationDrawer({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Container(
          color: Color.fromRGBO(229, 231, 236, 1.0),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(controller.user.nome),
                accountEmail: Text(controller.user.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    controller.user.email[0].toUpperCase(),
                    style: TextStyle(
                      fontSize: _width * 0.09,
                    ),
                  ),
                ),
              ),
              ExpansionTile(
                title: Text("Fazendas"),
                leading: Icon(
                  MyIcons.farms,
                  color: Colors.red,
                  size: _width * 0.1,
                ),
                children:
                    List.generate(controller.user.fazenda.length, (index) {
                  return ExpansionTile(
                    title: Text(controller.user.fazenda.values.toList()[index]),
                    leading: Icon(
                      MyIcons.farm,
                      color: Colors.red,
                      size: _width * 0.1,
                    ),
                    children: [
                      ListTile(
                        leading: Icon(
                          MyIcons.bottle,
                          color: Colors.red,
                          size: _width * 0.1,
                        ),
                        title: Text("Botijões"),
                        onTap: () {
                          path = controller.user.fazenda.keys.toList()[index];

                          controller.getBot(
                              controller.user.fazenda.keys.toList()[index]);
                        },
                      ),
                      /*   ListTile(
                        leading: Icon(
                          MyIcons.history,
                          color: Colors.red,
                          size: _width * 0.1,
                        ),
                        title: Text("Hístorico"),
                        onTap: () {},
                      ),*/
                      ListTile(
                        leading: Icon(
                          MyIcons.employee,
                          color: Colors.red,
                          size: _width * 0.1,
                        ),
                        title: Text("Colaboradores"),
                        onTap: () {
                          Modular.to.pushNamed('/colab', arguments: [
                            controller.user.fazenda.values.toList()[index],
                            controller.user.fazenda.keys.toList()[index]
                          ]);
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: _width * 0.1,
                        ),
                        title: Text("Excluir"),
                        onTap: () {
                          controller.removeFarm(
                              controller.user.fazenda.keys.toList()[index]);
                        },
                      ),
                    ],
                  );
                }),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_location,
                  color: Colors.red,
                  size: _width * 0.1,
                ),
                title: Text("Adicionar Fazenda"),
                onTap: () {
                  Modular.to
                      .pushNamed('/home/addFarm', arguments: [controller.user]);
                },
              ),
              ListTile(
                leading: Icon(
                  MyIcons.exit,
                  color: Colors.red,
                  size: _width * 0.1,
                ),
                title: Text("Sair"),
                onTap: () async {
                  await controller.auth.signOut();

                  Modular.to.pushNamed('/', arguments: null);
                },
              ),
            ],
          )),
    );
  }
}
