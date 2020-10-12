import 'package:flutter/material.dart';

import 'package:space_farming_modular/app/shared/models/user.dart';

import 'my_icons_icons.dart';

class NavigationDrawer extends StatelessWidget {
  final User user;
  const NavigationDrawer({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  "U",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                MyIcons.icon_botijao,
                color: Colors.red,
              ),
              title: Text("Botijões"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.red,
              ),
              title: Text("Hístorico"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: Text("Sair"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
