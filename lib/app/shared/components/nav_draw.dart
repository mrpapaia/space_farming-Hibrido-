import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/farm.dart';

import 'package:space_farming_modular/app/shared/models/user.dart';
import 'package:space_farming_modular/app/shared/repositories/farmrepository.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryfarm.dart';

import 'my_icons_icons.dart';

class NavigationDrawer extends StatelessWidget {
  final UserP user;
  final List<Farm> farms;
  const NavigationDrawer({Key key, this.user, this.farms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    IRepositoryFarm repositoryFarm = FarmRepository(FirebaseFirestore.instance);
    return Drawer(
      child: Container(
        color: Color.fromRGBO(229, 231, 236, 1.0),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user.nome),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  user.email[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: _width * 0.09,
                  ),
                ),
              ),
            ),
            ExpansionTile(
              title: Text("Fazendas"),
              children: List.generate(user.fazenda.length, (index) {
                return ExpansionTile(
                  title: Text(user.fazenda[index]),
                  children: [
                    ListTile(
                      leading: Icon(
                        MyIcons.icon_botijao,
                        color: Colors.red,
                        size: _width * 0.1,
                      ),
                      title: Text("Botijões"),
                      onTap: () {
                        /* Modular.to.pushNamed('/home',
                            arguments: [, user]);*/
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.red,
                        size: _width * 0.1,
                      ),
                      title: Text("Hístorico"),
                      onTap: () {},
                    ),
                  ],
                );
              }),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
                size: _width * 0.1,
              ),
              title: Text("Sair"),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Modular.to.pushNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
