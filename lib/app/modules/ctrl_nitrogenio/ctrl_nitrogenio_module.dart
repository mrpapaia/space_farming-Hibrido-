import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/abastecer/abastecer_page.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/historico/historico_page.dart';
import 'package:space_farming_modular/app/modules/ctrl_nitrogenio/pages/medir_nivel/medir_nivel_page.dart';
import 'package:space_farming_modular/app/shared/repositories/botijaorepository.dart';
import 'package:space_farming_modular/app/shared/repositories/histabastecimentorepository.dart';
import 'package:space_farming_modular/app/shared/repositories/histnivelrepository.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositorybotijao.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistabastecimento.dart';
import 'package:space_farming_modular/app/shared/repositories/interfaces/irepositoryhistnivel.dart';

import 'pages/historico/historico_controller.dart';
import 'pages/abastecer/abastecer_controller.dart';
import 'pages/medir_nivel/medir_nivel_controller.dart';
import 'ctrl_nitrogenio_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'ctrl_nitrogenio_page.dart';

class CtrlNitrogenioModule extends ChildModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => MedirNivelController(i.get(), i.get())),
      Bind((i) => AbastecerController(i.get(), i.get())),
      Bind((i) => HistoricoController(i.get(), i.get())),
      Bind<IRepositoryBotijao>(
          (i) => BotijaoRepository(FirebaseFirestore.instance)),
      Bind<IRepositoryHistoricoNivel>(
        (i) => HistoricoNivelRepository(
            FirebaseFirestore.instance, i.args.data[0].ref),
      ),
      Bind<IRepositoryHistoricoAbastecimento>(
        (i) => HistoricoAbastecimentoRepository(
            FirebaseFirestore.instance, i.args.data[0].ref),
      ),
      $CtrlNitrogenioController,
    ];
  }

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CtrlNitrogenioPage(
                  botijao: args.data[0],
                  user: args.data[1],
                )),
        ModularRouter("/medirNivel",
            child: (_, args) => MedirNivelPage(
                  botijao: args.data[0],
                  user: args.data[1],
                )),
        ModularRouter("/abastecer",
            child: (_, args) => AbastecerPage(
                  botijao: args.data[0],
                  user: args.data[1],
                )),
        ModularRouter("/historico",
            child: (
              _,
              args,
            ) =>
                HistoricoPage(
                  doc: args.data[0].ref,
                  bot: args.data[0],
                )),
      ];

  static Inject get to => Inject<CtrlNitrogenioModule>.of();
}
