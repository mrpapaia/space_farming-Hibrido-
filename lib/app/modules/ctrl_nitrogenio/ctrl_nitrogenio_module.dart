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
      Bind((i) => MedirNivelController(
          i.get(), i.get(), i.args.data[0], i.args.data[1])),
      Bind((i) => AbastecerController(
          i.get(), i.get(), i.args.data[0], i.args.data[1])),
      Bind((i) => HistoricoController(i.get(), i.get(), i.args.data[0])),
      Bind<IRepositoryBotijao>(
          (i) => BotijaoRepository(FirebaseFirestore.instance)),
      Bind<IRepositoryHistoricoNivel>(
        (i) => HistoricoNivelRepository(FirebaseFirestore.instance),
      ),
      Bind<IRepositoryHistoricoAbastecimento>(
        (i) => HistoricoAbastecimentoRepository(FirebaseFirestore.instance),
      ),
      Bind((i) => CtrlNitrogenioController())
    ];
  }

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CtrlNitrogenioPage(
                  botijao: args.data[0],
                  user: args.data[1],
                )),
        ModularRouter("/medirNivel", child: (_, args) => MedirNivelPage()),
        ModularRouter("/abastecer", child: (_, args) => AbastecerPage()),
        ModularRouter("/historico", child: (_, args) => HistoricoPage()),
      ];

  static Inject get to => Inject<CtrlNitrogenioModule>.of();
}
