import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/historico/components/historicoAbastecimento.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/historico/components/historicoNivel.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/nav_draw.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'historico_controller.dart';

class HistoricoPage extends StatefulWidget {
  final String title;
  const HistoricoPage({Key key, this.title = "Historico"}) : super(key: key);

  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState
    extends ModularState<HistoricoPage, HistoricoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(
                double.infinity,
                100,
              ),
              child: SecAppBar()),
          drawer: NavigationDrawer(),
          backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
          body: Column(
            children: [
              TitleOfScreen(
                title: "Histórico do Botijão",
                font: "Revalia",
                fontSize: 24,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: TabBarView(
                  children: [
                    HistoricoNivel(),
                    SingleChildScrollView(child: HistoricoAbastecimento()),
                  ],
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            height: 50,
            color: Colors.white,
            child: TabBar(
              tabs: [
                Text(
                  "Informações",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Estados",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
              indicatorColor: Colors.red,
              labelColor: Colors.red,
            ),
          ),
        ));
  }
}
