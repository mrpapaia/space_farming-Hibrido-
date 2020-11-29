import 'package:firebase_core/firebase_core.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/ctrl_nitrogenio_module.dart';
import 'package:space_farming_modular/app/modules/ctrl_racks/ctrl_racks_module.dart';

import 'package:space_farming_modular/app/modules/login/login_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:space_farming_modular/app/app_widget.dart';
import 'package:space_farming_modular/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      $AppController,
    ];
  }

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
        ModularRouter("/ctrl", module: CtrlNitrogenioModule()),
        ModularRouter("/rack", module: CtrlRacksModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
