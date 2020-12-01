import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:space_farming_modular/app/modules/home/pages/home_bot_create/home_bot_create_controller.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_bot_create/home_bot_create_page.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/home_info_bot_controller.dart';
import 'package:space_farming_modular/app/modules/home/pages/home_info_bot/home_info_bot_page.dart';

import 'package:space_farming_modular/app/shared/repositories/botijaorepository.dart';
import 'package:space_farming_modular/app/shared/repositories/canecasrepository.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorycanecas.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => HomeController(i.get(), i.get())),
      Bind((i) => HomeInfoBotController(i.get())),
      Bind<IRepositoryBotijao>(
          (i) => BotijaoRepository(FirebaseFirestore.instance)),
      Bind<IRepositoryCanecas>(
          (i) => CanecasRepository(FirebaseFirestore.instance)),
      Bind((i) => HomeBotCreateController(i.get())),
    ];
  }

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => HomePage(
            userP: args.data,
          ),
        ),
        ModularRouter(
          "/info",
          child: (_, args) => HomeInfoBotPage(
            botijao: args.data[0],
            user: args.data[1],
          ),
        ),
        ModularRouter(
          "/add",
          child: (_, args) => HomeBotCreatePage(),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
