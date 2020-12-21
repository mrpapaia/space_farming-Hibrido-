import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/shared/models/user.dart';
import 'my_icons_icons.dart';

class NavigationDrawer extends StatelessWidget {
  final UserP user;

  const NavigationDrawer({Key key, this.user}) : super(key: key);

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
                  leading: Icon(
                    Icons.terrain,
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
                      onTap: () {},
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
                    ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.red,
                        size: _width * 0.1,
                      ),
                      title: Text("Funcionarios"),
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
